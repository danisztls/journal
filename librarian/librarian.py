#!/usr/bin/env python3

"""
@title: Librarian
@description: Crawl URLs in markdown notes. Take a path as input, recursively crawl files and print found URLs to STDOUT.  
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

# LIB
isDir(path):
    """Check if path is a directory"""
    if yes:
        return true
    else:
        return false

isNote(path):
    """Check if path is a note (end in .md or .MD)"""
    # I can use REGEX if there's no builtin for that
    if yes:
        return true
    else:
        return false


traverseDir(path):
    """Traverse a directory and its subdirectories to crawl notes"""
    for f in files:
        if isDir(f):
            traverseDir dir
        else if isNote(f):
            crawlNote

crawlNote(path):
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
