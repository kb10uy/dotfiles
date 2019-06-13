import json
from installer import console

class Configuration:
    def __init__(self):
        self.entries = []
        self.prerequisites = []

    def load(self, path: str):
        try:
            with open(path) as f:
                json_data = json.load(f)
            self.prerequisites = json_data.get('prerequisites')
            self.entries = [MenuEntry(e) for e in json_data.get('entries')]
        except json.JSONDecodeError:
            pass
        except:
            console.fatal('Invalid configuration', True)

class MenuEntry:
    def __init__(self, obj: dict):
        self.name = obj.get('name')
        self.description = obj.get('description')
