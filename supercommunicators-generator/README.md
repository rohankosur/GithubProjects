# Supercommunicators Multi-Agent Generator (Google Antigravity SDK)

An automated 3-agent workflow built with the **Google Antigravity SDK** (`google-antigravity`) to generate, audit, and serialize scenarios based on Charles Duhigg's *Supercommunicators* framework for training modern communication skills.

## Agent Architecture & Roster

| Agent | Target Function | Core Responsibility |
| :--- | :--- | :--- |
| **Agent A (`ScenarioGenerator`)** | Context & Question Writer | Drafts realistic 2020s scenarios across channels (iMessage, Slack, Zoom, In-person) with high subtext and matching traps. |
| **Agent B (`DuhiggAuditor`)** | Quality Control & Alignment | Verifies the question against Duhigg's core principles (Matching state, Looping for Understanding, Traps). Rejects or approves with corrections. |
| **Agent C (`SchemaFormatter`)** | Data Structuring | Converts approved raw scenarios into strict, validated JSON matching a Pydantic `ScenarioSchema`. |

---

## Directory Structure

```
supercommunicators-generator/
├── schema.py        # Pydantic data models (ScenarioSchema, Option)
├── prompts.py       # System prompts for Agent A, Agent B, and Agent C
├── orchestrator.py  # Python orchestration pipeline using Google Antigravity SDK
└── README.md        # Documentation and usage guide
```

---

## Installation & Prerequisites

1. **Python Environment**: Python 3.10+
2. **Install Dependencies**:
   ```bash
   pip install google-antigravity pydantic
   ```
3. **Environment Setup**:
   Ensure `GEMINI_API_KEY` is set in your environment:
   ```bash
   export GEMINI_API_KEY="your-api-key"
   ```

---

## Usage

Run the orchestrator script:

```bash
python orchestrator.py
```

The output will be printed to stdout and saved to `seed_data.json` ready for database ingestion.
