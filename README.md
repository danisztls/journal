<!-- TOC GitLab -->

* [Features](#features)
* [Design](#design)
* [Task management](#task-management)
        * [Syntax](#syntax)
* [Journaling](#journaling)
* [Setup](#setup)
* [Development](#development)

<!-- /TOC -->

**Journal** is a place to organize your life and get things done. It is an agnostic approach to note management and personal organization.

## Features
- A journaling helper *(to take notes like a Starfleet captain)*.
- Task management with markdown notes without effort.
- Fuzzy search for todos in your files.
- Easily plan a sprint.

## Design
- Notes are short named [markdown](markdown.md) files and thus can be viewed and edited in any text editor and easily exported to any format.
- Assets are images, documents and other files linked inside notes. [^contained]
- Hyperlinks are the glue that connects everything into a meaningful knowledge base.
- Tasks are lines in notes that start with the `TODO:` placeholder, a common convention. 
- Log entries are time named notes that are merged and archived after some time.
- Scripts automates trivial tasks and creates useful functionality that goes beyond pen and paper or conventional text editing.
- Notes are contained in plain text files inside directories. What fits under the same scope is put in the same subdirectory. [^hierarchical]
- Besides file system, it's stateless and safe to use with version control systems and file syncing tools.
- Journal preserve tasks contexts. By not pulling task management away from their context of execution it improves feedback, learning and value delivery evaluation.
- Journal is interoperable with any text editor and is more an agnostic personal organization system than a software. [^interoperability]

## Task management
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

#### Syntax
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

## Setup
Run the **setup** script to install it in home. Dependencies are **ripgrep**, **fzf**, **bat**.

I will write an AUR script in the future but I am not comfortable releasing it now as I am doing frequent design changes.

## Development
This project is still in it's infancy. Contributors and feedback are welcomed. Development info at [DEVELOPMENT.md](https://gitlab.com/lbcnz/journal/-/blob/master/DEVELOPMENT.md).

[^contained]: Assets should, preferably, be contained in the same directory as it parent note. If they are stored somewhere else it will be painful to move the note without breaking links. Also Electron based text editors, like Visual Studio, will not allow access to assets outside root directory of file. In other words, preview will be broken.

[^hierarchical]: Tags are popular nowadays and really useful but file systems are hierarchical and I am sticking with it. Although you can still tag your notes and use content search to find tagged notes, you can even put everything inside a single directory.

[^interoperability]: Agnosticism, botttom-up approach, form follows functions, minimalism and modularity are principles that guide its development.

