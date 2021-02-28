<!-- TOC GitLab -->

- [About](#about)
    - [Features](#features)
- [Usage](#usage)
    - [Tasks](#tasks)
        - [Syntax](#syntax)
    - [Journaling](#journaling)
- [Setup](#setup)
- [Development](#development)

<!-- /TOC -->

# About
**Journal** is a place to organize your life and get things done. It is an agnostic approach to note management and personal organization.

## Features
- A journaling helper *(to take notes like a Starfleet captain)*.
- Task management with markdown notes without effort.
- Fuzzy search for todos in your files.
- Easily plan a sprint.

# Usage
## Tasks
Manage tasks, keep track and archive them after they are done.

**How to use**
- `journal show` print the tasks to stdout in plain text;
- `journal print` show the tasks in a pager with pretty formatting;
- `journal search` search tasks in fzf with note preview;
- `journal commit` clean done tasks and write them to journal.

Commit function will post-call `git commit -m $today_date`.

Search binds:
- F1 opens task note in `$EDITOR`
- F2 opens task note with `xdg-open`
- F3 cycles task priority tag 
- F4 deletes the task

### Syntax
**Priority**
- +asap
- +later
- +done

**Context**
- #house
- #linux

**People**
- @danisztls

## Journaling
Aids in the management a markdown diary and saves time that would be spent with file naming and copy/paste.

**How to use**
- `journal write` open a new entry in a text editor.
- `journal read` fuzzy browse among entries.
- `journal rotate` rotate old entries into monthly/yearly notes.

It expects notes saved in **YY-MM-DD.md**, **YY-MM.md** and **YY.md** format and will ignore other files. The default retention policy is 15 days for daily entries and 6 months for monthly entries.

# Setup
Run the **setup** script to install it in home. Dependencies are **ripgrep**, **fzf**, **bat**.

I will write an AUR script in the future but I am not comfortable releasing it now as I am doing frequent design changes.

# Development
This project is still in it's infancy. Contributors and feedback are welcomed. Development info at [DEVELOPMENT.md](https://gitlab.com/lbcnz/journal/-/blob/master/DEVELOPMENT.md).
