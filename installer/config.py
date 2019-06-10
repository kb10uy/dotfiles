import json

class Configuration:
    def __init__(self):
        self.entries = []

    def load(self, path: str):
        try:
            with open(path) as f:
                json_data = json.load(f)
            self.entries = [MenuEntry(e) for e in json_data]
        except json.JSONDecodeError:
            pass


class MenuEntry:
    def __init__(self, obj):
        self.name = obj.name
        self.description = obj.description
