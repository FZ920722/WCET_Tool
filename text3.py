#!/usr/bin/env python3

import os
import re
import json
from argparse import ArgumentParser

if __name__ == "__main__":
    with open("/home/fyj/DiskD/WCET_Tool/Data/os_cfg.json", "r", encoding="utf-8") as f:
        loaded_data = json.load(f)
    print(loaded_data)
    pass
