# Librarian
Librarian archives URLs without getting on your way.

## User stories
- I just want to automatically snapshot a webpage in case it get updated or removed. I don't need many features and as far as I care it can be a simple call to the [Wayback Machine](https://web.archive.org/). It just need to be automatic and effective.
- I want to store a readable version on cloud to access from anywhere and easily share with anyone.
- I want to have a full offline copy on premises in case I lose access to the Internet.

## Features
- [x] Extract URLs and export to stdout
- [ ] Track URLs with SQLite
- [ ] Watch file system for changes
- [ ] Systemd service
- [ ] Purge from storage URLs that don't exist on notes
- [ ] REST API
- [ ] Python API
- [ ] Parse pages with [Readability](https://github.com/mozilla/readability)
- [ ] Remove useless parameters from URLs (like [ClearURLs](https://github.com/ClearURLs/Addon))

## Usage
### Setup
Edit `$HOME/.config/journal/librarian.config`.

```sh
# Start and enable service
systemctl --user enable librarian && systemctl --user start librarian
```

### CLI
```sh
# Add URL
librarian add <url>

# Crawl markdown notes
librarian crawl <path>

# Monitor a path for changes
librarian monitor <path>

# Purge removed
librarian purge
```

### REST API
Retrieve an URL

`https://example.com/lib/<url>`

Add and URL or force refetch

`https://example.com/lib/add/<url>`

## See also
### ArchiveBox
[ArchiveBox](https://github.com/ArchiveBox/ArchiveBox) is a web archiving tool written with a web UI and a CLI. REST and Python API are in development but still crude. It can be installed with Docker or PIP.

Librarian exported URLs can be used as a source via the [command-line interface](https://github.com/ArchiveBox/ArchiveBox/wiki/Usage#CLI-Usage). 

```sh
# add pages
archivebox add < urls.txt            

# remove pages
archivebox remove --yes --delete < urls.txt
```
