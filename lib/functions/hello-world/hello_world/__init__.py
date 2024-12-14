from typing import Dict, Any


def handler(event: Dict[str, Any], context: Any) -> Dict[str, str]:
    name = event.get("name", "World")

    return {
        "Name": name,
        "Message": f"Hello {name}!",
    }


__all__ = [
    "handler"
]