<!-- TOC GitLab -->

- [About](#about)
    - [Principles](#principles)
    - [Architecture](#architecture)
    - [Features](#features)
- [How-to](#how-to)
    - [Tasks management](#tasks-management)
        - [Syntax](#syntax)
    - [Diary](#diary)
    - [Search](#search)
- [Setup](#setup)
- [Development](#development)

<!-- /TOC -->

# About
**Journal** is a place to organize your life and get things done. It is an agnostic approach to note management and personal organization integrated to the desktop and console environments.

## Principles
- Bottom-up approach. Tools that already exists should be reused. It's a waste to reinvent the wheel and old technologies that proved to be effective and reliable generally have richer ecossystems and bigger chance of survival through ages than their newer counterparts *(Lindy effect)*.
- Form follows function. Technologies are tools developed by us to enable us to do things better and easier. The effectiveness, efficiency and reliability of the tool is all that matters.
- Minimalism. The problem should be reduced to a small set of use cases for which value delivering is self-evident. Unjustifiable complexity leads to waste and bad design.
- Agnosticism. Systems should be able to interoperate. Needs come and go and so do their associated tools. Retooling is a big waste of time and should be avoided or mitigated.

## Architecture
- Notes are short named [markdown](markdown.md) files and thus can be nicely viewed and edited in any text editor and easily exported to any format.
- Assets are images, documents and other files linked inside notes. [^rationale-contained]
- Hyperlinks are the glue that connects everything into a meaningful knowledge base.
- Tasks are lines in notes that start with the `TODO:` placeholder, a common convention. 
- Log entries are time named notes that are merged and archived after some time.
- Scripts automates trivial tasks and creates useful functionality that goes beyond pen and paper or conventional text editing.
- Notes are contained in plain text files inside directories. What fits under the same scope is put in the same subdirectory. [^rationale-hierarchical]
- There are no version, lock or control files and besides filesystem timestamps it's stateless. It is safe to use with version control systems and/or any syncing tools.

[^rationale-contained]: Assets should, preferably, be contained in the same directory as it parent note. If they are stored somewhere else it will be a pain in the ass to move the note without breaking links. Also Electron based text editors, like VSCode, will not allow access to assets outside root dir of file. In other words, preview will be broken.

[^rationale-hierarchical]: Tags are popular nowadays and really useful but file systems are hierarchical and I am sticking with it. Although you can still tag your notes and use content search to find tagged notes, you can even put everything inside a single directory.

## Features
- Tasks management without pain.
- Syntax/highlighting for Vim.
- Markdown diary *(to take notes like a Starfleet captain)*.

# How-to
## Tasks management
Journal is capable of managing tasks, allowing you to keep track of tasks and archiving them after they are done.

**How to use**
- `journal-tasks show` print the tasks to stdout in plain text;
- `journal-tasks print` show the tasks in a pager with pretty formatting;
- `journal-tasks fuzzy` show tasks in fzf with note preview;
- `journal-tasks commit` clean done tasks and write them to journal.

Commit function will post-call `git commit -m $today_date`.

Fzf binds:

- F1 opens task note in $EDITOR
- F2 opens task note with xdg-open
- F3 cycle task priority tag 
- F4 delete the task

### Syntax
**Priority**
- +asap
- +later
- +done

**Reminders**
- =20-07-30 *remind at July 30* 
- =07-01 *remind annualy at January 1*
- =07 *remind monthly at day 1* 
- =monday *remind weekly at monday*  

**Context**
- #house
- #linux

**People**
- @lbcnz

## Diary
Diary aids in the management a markdown diary. Mostly it saves time that would be spent in copy/paste and file naming.

**How to use**
- `journal-log write` open a new entry in a text editor.
- `journal-log read` fuzzy browse among entries.
- `journal-log clean` rotate old entries into monthly/yearly notes.

It expects notes saved in **YY-MM-DD.md**, **YY-MM.md** and **YY.md** format and will ignore other files. The default retention policy is 15 days for daily entries and 6 months for monthly entries.

## Search
[fzf](https://github.com/junegunn/fzf) and [ripgrep](https://github.com/BurntSushi/ripgrep) along custom code is used to quickly find, preview and edit notes. They are a robust combination that allows the user to search for files and tasks with speed and accuracy. [fzf-special](https://gitlab.com/lbcnz/dotfiles/-/blob/master/dots/.config/shell/functions/fzf-special) is a collection of specialized functions that I use with fzf outside of journal current scope. I may package them separatedly with a shorter name, fzX maybe. 

# Setup
Run the **setup** script to install it in home. Dependencies are **ripgrep**, **fzf**, **bat**.

I will write an AUR script in the future but I am not comfortable releasing it now as I am doing frequent design changes.

# Development
This project is still in it's infancy. Contributors and feedback are welcomed. Development info at [DEVELOPMENT.md](https://gitlab.com/lbcnz/journal/-/blob/master/DEVELOPMENT.md).

