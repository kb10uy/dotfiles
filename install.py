#!/usr/bin/env python3

import json
from os import path, getenv
from installer import console, config

base_dir = path.abspath(path.dirname(__file__))

def check_repository():
    console.waiting('Checking repository location')
    expected = path.abspath(path.join(getenv('HOME'), 'dotfiles'))
    if base_dir == expected:
        console.ok()
    else:
        console.ng()
        console.fatal('Invalid repository location: {}'.format(base_dir))
        console.fatal('Place dotfiles repository as {}'.format(expected), True)


# -----------------------------------------------------------------------------

console.banner()
check_repository()
