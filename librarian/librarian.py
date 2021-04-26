#!/usr/bin/env python3

"""
@title: Librarian
@description: Crawl markdown notes in a directory and print URLs.
@author: danisztls
@license: MIT
"""

import os
import re

# ---------------------------------------
# Future: Store URLs on a SQLite DB.

# fields: urls.uid (PK, hash of url + path), urls.url, urls.path, url.datetime

# remove duplicate URLs
# SELECT DISTINCT url from urls

# find orphaned URLs to remove
# SELECT uid FROM urls WHERE datemine < now
# ---------------------------------------

# CONFIG
PATH = "sample/"  # just for testing, later should serialize config file

# LIB
def traverse_dir(_path: str):
    """Traverse a directory and its subdirectories to crawl notes"""
    # traverse a path returning a 3-tuple (dirpath, dirnames, filenames)v
    for _dir in os.walk(_path):
        _parent = _dir[0]
        # iterate the files
        for _file in _dir[2]:
            # lower() is used to make match case insensitive
            if _file.lower().endswith('.md'):
                crawl_note(_parent + '/' + _file)


def crawl_note(_path: str):
    """Find URLs in a markdown note"""
    # read file content
    with open(_path, 'r') as file:
        _content = file.read()
    # use regex to look for url
    # match all http(s) urls
    pattern = re.compile(r"https?://[^\)\s]*")
    _urls = pattern.findall(_content)
    for _url in _urls:
        urls.append(_url)


def print_urls():
    """Print URLs to STDOUT """
    for url in urls:
        print(url)


def call_web_archive(_url: str):
    """Make a request to the Wayback Machine API requesting an snapshot"""
    # API Docs: https://archive.org/help/wayback_api.php

# MAIN
urls = []
traverse_dir(PATH)
print_urls()
