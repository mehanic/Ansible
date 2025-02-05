#!/usr/bin/env python3

import yaml
import pprint

with open("test.yml", "r") as file:
    data = yaml.safe_load(file)
    pprint.pprint(data)
