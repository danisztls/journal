# Journal
**Journal** is a place to organize your life and get things done. It is an agnostic CLI approach to personal organization and note taking.

[![GitHub Super-Linter](https://github.com/lbcnz/journal/workflows/Lint%20Code%20Base/badge.svg)](https://github.com/marketplace/actions/super-linter)

<!-- TOC GitLab -->

* [Features](#features)
* [Design](#design)
* [Usage](#usage)
  * [Task management](#task-management)
  * [Journaling](#journaling)
  * [Find/Read Binds](#findread-binds)
  * [Aliases](#aliases)
* [Setup](#setup)
  * [Dependencies](#dependencies)
  * [Install](#install)
  * [Config](#config)
  * [Uninstall](#uninstall)
* [Development](#development)
* [FAQ](#faq)
  * [Is it fast?](#is-it-fast)
  * [What is contained?](#what-is-contained)
  * [Why hierarchical instead of tags?](#why-hierarchical-instead-of-tags)
  * [What are the design principles?](#what-are-the-design-principles)

<!-- /TOC -->

## Features
**Task management**

- Task management within markdown notes using TODOs.
- Look for TODOs anywhere you wish.
- **Print** tasks to STDOUT for piping purposes.
- **Show** prettily formatted tasks on a pager.
- Fuzzy **find** for tasks while previewing file context.
- **Clean** done tasks and write them to a journaling file.

**Journaling**
- **Write** time-structured logs more easily than a Starfleet official would.
- Fuzzy find and **read** your entries.
- **Merge** old entries into monthly and yearly notes following a retention policy.
- Save time that would be spent with file naming and copy & paste.

![$ journal find](https://github.com/lbcnz/journal/blob/main/journal-fzf.png)

## Design
- Notes are short named [markdown](markdown.md) files and thus can be viewed and edited in any text editor and easily exported to any format.
- Assets are images, documents and other files linked inside notes.
- Hyperlinks are the glue that connects everything into a meaningful knowledge base.
- Tasks are lines in notes that start with the `TODO:` placeholder, a common convention.
- Log entries are time named notes that are merged and archived after some time.
- Scripts automates trivial tasks and creates useful functionality that goes beyond pen and paper or conventional text editing.
- Notes are contained in plain text files inside directories. What fits under the same scope is put in the same subdirectory.
- Besides file system, it's stateless and safe to use with version control systems and file syncing tools.
- Journal preserve tasks contexts. By not pulling task management away from their context of execution it improves feedback, learning and value delivery evaluation.
- Journal is interoperable with any text editor and is more an agnostic personal organization system than a software.

## Usage
### Task management
**TODO Syntax**

Priority
- +asap
- +later
- +done

Tags
- #house
- #linux

**CLI**
```sh
# Print the tasks to STDOUT as plain text
journal print

# Show tasks in a pager with pretty formatting
journal show

# Include all tasks (those with +later are excluded by default)
journal show -a

# Search tasks in Fzf with note preview;
journal find

# Clean done tasks within files and commit them on a journal.
journal clean
```

_Note: Clean function will post-call:_ `git commit -m "YY-MM-DD"`

### Journaling
```sh
# Create a new entry with your preferred text editor
journal write

# Start a daily 'standup'
journal write -d

# Fuzzy find and read entries
journal read

# Merge old entries into monthly and yearly notes
journal merge
```

**Merge** expects notes saved in `YY-MM-DD(.*).md`, `YY-MM.md` and `YY.md` format and will ignore other files. The default retention policy is 15 days for daily entries and 6 months for monthly entries.

_Note: Those notes are not deleted but grouped together in a single file._

### Find/Read Binds
- `F1` opens task note with `xdg-open`
- `F2` opens task note in `$EDITOR`
- `F3` cycles task priority tag _(Find only)_
- `DEL` deletes the task

### Aliases 
Set an alias for journal
```sh
echo "alias j='journal'" >> ~/.profile
```

You can use the first letter of a mode to invoke it.
```sh
j p # print
j s # show
j f # find
f c # clean
j w # write
j r # read
j m # merge
```

## Setup
### Dependencies
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fd](https://github.com/sharkdp/fd)
- [fzf](https://github.com/junegunn/fzf)
- [bat](https://github.com/sharkdp/bat)

### Install
Install through the [AUR](https://aur.archlinux.org/packages/journal-git/).

Use the Makefile.
```sh
sudo make install
```

Install as user.
```sh
./setup.sh install
```

### Config
Configuration files


### Uninstall
Depends on how you installed it.

```sh
# AUR
sudo pacman -Rcs journal-git
# Make
sudo make uninstall # from the project dir
# Locally
./setup.sh uninstall
```

## Development
Feedback and contributions are welcomed. Development info at [DEVELOPMENT.md](https://gitlab.com/lbcnz/journal/-/blob/main/DEVELOPMENT.md).

## FAQ
### Is it fast?
Yes. It is written in Bash but most of the heavy work is done by [ripgrep](https://github.com/BurntSushi/ripgrep) and it is the fastest file searches available. Unless you need to do terabyte volume searches it will get the job done. You can also set an ignore file to ignore large binaries objects and other non-desired files.

### What is contained?
Assets should, preferably, be contained in the same directory as it parent note. If they are stored somewhere else it will be painful to move the note without breaking links. Also Electron based text editors, like Visual Studio, will not allow access to assets outside root directory of file. In other words, preview will be broken.

### Why hierarchical instead of tags?
Tags are popular nowadays and really useful but file systems are hierarchical and I am sticking with it. Although you can still tag your notes and use content search to find tagged notes, you can even put everything inside a single directory.

### What are the design principles?
Agnosticism, bottom-up approach, form follows functions, minimalism, modularity and interoperability are principles that guide its development.
