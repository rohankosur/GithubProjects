import uuid
from typing import List, Literal
from pydantic import BaseModel, Field


class Option(BaseModel):
    id: Literal["A", "B", "C", "D"]
    text: str
    is_correct: bool
    response_type: Literal["Practical", "Emotional", "Social", "Mismatch"]
    feedback: str


class ScenarioSchema(BaseModel):
    scenario_id: str = Field(default_factory=lambda: str(uuid.uuid4()))
    channel: Literal["iMessage", "Slack", "Zoom", "In-Person"]
    conversation_type: Literal["Practical", "Emotional", "Social"]
    difficulty_level: Literal[1, 2, 3]
    context: str
    prompt: str
    options: List[Option]
    core_takeaway: str
