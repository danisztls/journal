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
    for _dir in os.walk(path):
        parent = _dir[0]
        # iterate the files
        for _file in _dir[2]:
            # lower() is used to make match case insensitive
            if _file.lower().endswith('.md'):
                crawl_note(parent + '/' + _file)

def crawl_note(_path):
    """Find URLs in a markdown note"""
    # read file content
    with open(_path, 'r') as file:
        _content = file.read()

    sensitive_pattern = re.compile(r"http[s]*://[^\)\s]*")
    specific_pattern  = re.compile(r"@(https?)://(-\.)?([^\s/?\.#-]+\.?)+(/[^\s]*)?$@iS")
    # iterate over lines
    for _line in _content.split('\n'):
        # use regex to look for url
        # hight sensitivity match to find all http(s) urls
        _url = re.search(sensitive_pattern, _line)
        if _url:
            # high specificity match to validate url
            if specific_pattern.match(_url):
                urls.append(_url)
            # TODO: log error when not valid
            #else
            #    log('ERROR')

# MAIN
urls=[]
traverseDir(path)
print(urls)
