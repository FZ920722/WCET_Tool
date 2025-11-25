#!/usr/bin/env python3

import os
import re
from pathlib import Path
from argparse import ArgumentParser

if __name__ == "__main__":
    """
    parser = ArgumentParser(description='Fill the loop bound for the given file')

    parser.add_argument('-d', '--debug',    action='store_true',    help='Enable debug mode')
    parser.add_argument('-s', '--source',   type=str,               help='The source file to be filled')
    parser.add_argument('-r', '--range',    type=int,   default=3,  help='The range to search for loop bound')

    args = parser.parse_args()

    DEBUG = args.debug
    SOURCE = args.source
    LINES_TO_SEARCH = args.range
    """
    
    SOURCE = 123
    LINES_TO_SEARCH = 3

    FILERE = re.compile(r'Loop in file (.*) near line (.*)')
    LOOPRE = re.compile(r'\w*_Pragma\(\s*\"loopbound\s*min\s*(\d+)\s*max\s*(\d+)\s*\"\s*\).*')

    FILECACHES = dict()