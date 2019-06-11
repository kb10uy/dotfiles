#!/usr/bin/env python3

import json
from os import path, getenv
from installer import console, config, wizard

base_dir = path.abspath(path.dirname(__file__))
config_list = config.Configuration()
config_list.load(path.join(base_dir, 'config.json'))

w = wizard.Wizard(base_dir, config_list)
w.run()

