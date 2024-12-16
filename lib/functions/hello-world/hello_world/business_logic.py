from typing import Dict, Any


def business_logic(event: Dict[str, Any]) -> str:
    return event.get("name", "World")
