from typing import Dict, Any
# Example of the relative import
from .business_logic import business_logic


def handler(event: Dict[str, Any], context: Any) -> Dict[str, str]:
    # User the method that is imported based on a relative path
    name = business_logic(event)

    return {
        "Name": name,
        "Message": f"Hello {name}!",
    }


__all__ = [
    "handler"
]