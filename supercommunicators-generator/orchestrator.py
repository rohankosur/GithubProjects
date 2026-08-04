"""
Multi-Agent Orchestrator using the Google Antigravity SDK.

Pipeline:
Agent A (ScenarioGenerator) -> Agent B (DuhiggAuditor) -> Agent C (SchemaFormatter)
"""

import asyncio
import json
import logging
import sys
from pathlib import Path
from typing import Any, Dict, Optional

from google.antigravity import Agent, LocalAgentConfig

from prompts import (
    SYSTEM_PROMPT_AUDITOR,
    SYSTEM_PROMPT_FORMATTER,
    SYSTEM_PROMPT_GENERATOR,
)
from schema import ScenarioSchema

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s",
    handlers=[logging.StreamHandler(sys.stdout)],
)


async def run_scenario_pipeline(
    topic: str = "Workplace stress and project deadline friction",
    channel_preference: Optional[str] = None,
    max_audit_retries: int = 3,
) -> Dict[str, Any]:
    """Executes the multi-agent workflow sequentially with validation.

    1. Agent A (ScenarioGenerator): Creates 1 scenario & MCQ draft. 2. Agent B
    (DuhiggAuditor): Audits draft against Duhigg's core rules. Accepts or
    revises. 3. Agent C (SchemaFormatter): Converts approved scenario into
    structured JSON via Pydantic.
    """
    # ----------------------------------------------------
    # Step 1: Agent A - Generator
    # ----------------------------------------------------
    logging.info("🚀 [Agent A: ScenarioGenerator] Generating draft scenario...")
    generator_config = LocalAgentConfig(
        system_instructions=SYSTEM_PROMPT_GENERATOR
    )

    user_prompt = f"Topic/Focus: {topic}"
    if channel_preference:
        user_prompt += f"\nPreferred Channel: {channel_preference}"

    async with Agent(config=generator_config) as agent_a:
        gen_response = await agent_a.chat(user_prompt)
        draft_scenario = await gen_response.text()

    logging.info("📄 [Agent A] Draft Scenario Generated:\n" + draft_scenario[:300] + "...\n")

    # ----------------------------------------------------
    # Step 2: Agent B - DuhiggAuditor
    # ----------------------------------------------------
    logging.info("🔍 [Agent B: DuhiggAuditor] Auditing draft scenario...")
    auditor_config = LocalAgentConfig(
        system_instructions=SYSTEM_PROMPT_AUDITOR
    )

    current_draft = draft_scenario
    approved_text = None

    for attempt in range(1, max_audit_retries + 1):
        logging.info(f"  Audit Pass {attempt}/{max_audit_retries}...")
        audit_prompt = f"Please audit the following draft scenario:\n\n{current_draft}"

        async with Agent(config=auditor_config) as agent_b:
            audit_response = await agent_b.chat(audit_prompt)
            audit_result = await audit_response.text()

        logging.info(f"  [Agent B Audit Result Summary]:\n{audit_result[:250]}...\n")

        if "STATUS: APPROVED" in audit_result:
            logging.info("✅ [Agent B] Scenario APPROVED without further edits!")
            approved_text = current_draft
            break
        elif "STATUS: REJECTED" in audit_result:
            logging.warning(f"⚠️ [Agent B] Scenario REJECTED on attempt {attempt}.")
            # Agent B provides corrected/updated draft when REJECTED
            approved_text = audit_result
            current_draft = audit_result
        else:
            # Fallback status matching
            if "APPROVED" in audit_result.upper():
                logging.info("✅ [Agent B] Scenario APPROVED (fuzzy match).")
                approved_text = current_draft
                break
            else:
                current_draft = audit_result

    if not approved_text:
        logging.info("ℹ️ Using latest revised scenario version for serialization.")
        approved_text = current_draft

    # ----------------------------------------------------
    # Step 3: Agent C - SchemaFormatter
    # ----------------------------------------------------
    logging.info("📦 [Agent C: SchemaFormatter] Serializing into validated Pydantic JSON...")
    formatter_config = LocalAgentConfig(
        system_instructions=SYSTEM_PROMPT_FORMATTER,
        response_schema=ScenarioSchema,
    )

    format_prompt = (
        "Convert this approved scenario text into valid JSON matching the schema:\n\n"
        + approved_text
    )

    async with Agent(config=formatter_config) as agent_c:
        format_response = await agent_c.chat(format_prompt)
        structured_data = await format_response.structured_output()

    logging.info("✨ [Agent C] Data successfully structured into JSON schema!")
    return structured_data


async def main():
    topic = "Managing team burnout and scope creep during product launch"
    channel = "Slack"

    logging.info("==================================================")
    logging.info("STARTING ANTIGRAVITY MULTI-AGENT WORKFLOW")
    logging.info("==================================================")

    data = await run_scenario_pipeline(topic=topic, channel_preference=channel)

    # Display result
    output_json = json.dumps(data, indent=2)
    print("\n" + "=" * 50)
    print("FINAL SEED FILE JSON OUTPUT")
    print("=" * 50)
    print(output_json)

    # Write to seed file
    output_path = Path(__file__).parent / "seed_data.json"
    with open(output_path, "w", encoding="utf-8") as f:
        f.write(output_json)
    logging.info(f"Saved JSON seed output to {output_path}")


if __name__ == "__main__":
    asyncio.run(main())
