#!/usr/bin/env python3

"""
@title: Librarian
@description: Crawl markdown notes in a directory and print URLs.
@author: danisztls
@license: MIT
"""

"""
1st stage: Export the URLs as plain text to pipe to ArchiveBox

2nd stage: Store URLs on a SQLite database for housekeeping
# fields: urls.uid (PK, hash of url + path), urls.url, urls.path, url.datetime

# remove duplicate URLs
# SELECT DISTINCT url from urls

# find orphaned URLs to remove
# SELECT uid FROM urls WHERE datemine < now
"""

import os

# LIB
def traverse_dir(path):
    """Traverse a directory and its subdirectories to crawl notes"""
    # traverse a path returning a 3-tuple (dirpath, dirnames, filenames)
    for dir in os.walk(path):
        parent = dir[0]
        # iterate the files
        for file in dir[2]:
            # lower() is used to make match case insensitive
            if file.lower().endswith('.md'):
                crawl_note(parent + '/' + file)

def crawl_note(path):
    """Find URLs in a markdown note"""
    # load file
    data =

    for l in data:
        # use regex to look for url
        if matchURL(l):
            urls.append(url)

# MAIN
urls=[]
traverseDir(path)
print(urls)
