<!-- TOC GitLab -->

- [Design](#design)
- [Nexus](#nexus)
- [Journal](#journal)
	- [Todo syntax](#todo-syntax)
	- [Highlighting](#highlighting)
	- [Calendar](#calendar)
	- [Diary](#diary)
	- [Planning](#planning)
- [Eudaemon](#eudaemon)
- [Install](#install)
- [Development](#development)

<!-- /TOC -->

Workshop is a place to organize your life and get things done. It is an agnostic approach to note management and personal organization integrated to the desktop and console environments.

*Isn't forge a better sounded and less overused name?*

# Design
**Design principles**

- Bottom-up approach. Tools that already exists should be reused. It's a waste to reinvent the wheel and old technologies that proved to be effective and reliable generally have richer ecossystems and bigger chance of survival through ages than their newer counterparts *(Lindy effect)*.
- Form follows function. Technologies are tools developed by us to enable us to do things better and easier. The effectiveness, efficiency and reliability of the tool is all that matters.
- Minimalism. The problem should be reduced to a small set of use cases for which value delivering is self-evident. Unjustifiable complexity leads to waste and bad design.
- Agnosticism. Systems should be able to interoperate. Needs come and go and so do their associated tools. Retooling is a big waste of time and should be avoided or mitigated.

**System design**

- Everything is inside a root workshop directory, notes, assets, source codes.
- Files that fit under the same scope are put in a subdirectory. *Tags are popular but file systems are hierarchical and I am sticking with it.*
- Notes are short named [markdown](markdown.md) files and thus can be nicely viewed and edited in any text editor and easily exported to any format.
- Tasks are lines in notes that start with the `TODO:` placeholder. It's a common convention. 
- Assets are images, documents and other files contained in a single hidden folder and linked inside notes.
- Hyperlinks are the glue that holds everything into a meaningful knowledge base.
- Scripts automates trivial tasks and creates useful functionality that goes beyond pen and paper or conventional text editing.


# Nexus
Nexus is the Latin radical for conciseness. It is a document management system with the goal to seamless integrate three core functions: archive, discover and provide. Archive means that the system should store and version the documents. Discover means that the user have a way to find the right documents through context or search. Provide means that the user can view/edit documents and share them with others easily.

Notes are saved in Markdown and metadata inserted with a YAML header. Notes can be exported to practically any format using Pandoc and easily published with Jekyll.


**Fuzzy finder**
To quickly find, preview and edit notes I use [fzf](https://github.com/junegunn/fzf) with [ripgrep](https://github.com/BurntSushi/ripgrep) and custom aliases. They are a robust combination that allows me to search files and tasks.

**Graph**
TODO: Graph, a tool that generates a graph of scopes, notes and their links. It purpose is to aid in reorganizing notes into concise scopes. +later

**Cleaner**
TODO: Cleaner, a script that will search for unlinked assets and send them to trash. +later

**Fixer**
TODO: Fixer, a tool to search for broken links in notes and aid in fixing them. +later


# Journal
Journal is a tool to manage tasks, to keep track of what is to be done and what is done.

**How to use**
- `journal show` print the tasks to stdout in plain text;
- `journal print` show the tasks in a pager with pretty formatting;
- `journal fuzzy` show tasks in fzf with note preview;
- `journal commit` clean done tasks and write them to journal.

Commit function will post-call `git commit -m $today_date`.

Fzf binds:

- F1 opens task note in $EDITOR
- F2 opens task note with xdg-open
- F3 cycle task priority tag 
- F4 delete the task



## Todo syntax
**Priority**
- +asap
- +later

**Time-related**
- =20-07-30 **at** date
- >20-07-30 **wait** for date
- !20-07-30 **until** date

Template variables for date: *monthly, weekly, daily, january, monday, day12* 

**Context**
- #house
- #linux

**People**
- @lbcnz

TODO: Swap > for ~ or other key for better compatibility. +asap

TODO: Try todo.txt

## Highlighting
Todo syntax and highlighting for Vim is implemented.

TODO: Sublime extended markdown todo highlighting to use in bat. +asap

Sublimes highlighting is done through a syntax files that attributes scopes to regex matches and a theme files that attributes colors to those scopes.

[Sublime docs](https://www.sublimetext.com/docs/3/syntax.html)

[Oniguruma RE docs](https://raw.githubusercontent.com/kkos/oniguruma/5.9.6/doc/RE)

I wrote some RE matches but the intricacies of Sublime were too complex for me to grasp in a short amount of time. 



## Calendar
Gnome Calendar have good integration with Gnome Shell. I just need to find a good way to add events to a local calendar. Is it possible to write a stateless script that does that to be called after a journal commit?

TODO: Stateless script to add tasks as events to a local Gnome calendar. +asap

There's also Gnome Todo. Can I interface with it?

## Diary
Diary aids in the management a markdown diary.  Mostly it saves time that would be spent in copy/paste and file naming.

**How to use**
- `diary write` open today's entry in a text editor.
- `diary clean` rotate old entries into monthly/yearly notes.
- `diary read` fuzzy search among entries.

It expects notes saved in **YY-MM-DD.md**, **YY-MM.md** and **YY.md** format and will ignore other files. The default retention policy is 15 days for daily entries and 6 months for monthly entries.


## Planning
Planner, is a tool to organize the backlog, pack tasks into sprints, roadmap projects and see statistics like backlog size and burnout rate.

TODO: Log backlog statistics with every commit. +later

TODO: Graphically explore the backlog statistics. +later


# Eudaemon
Eudaemon is the Greek concept of good guardian spirit. It aids the user in seeing clearly his actions and avoiding unhealthy habits like use the computer for a long period of time.

*Socrates during his lifetime had a daemon that always warned him of threats and bad judgment but never directed his actions.* 

As I dislike micromanagement and obtrusive software I'm thinking on using libnotify. It's trivial to implement and Gnome Shell have a do not disturb feature if the user really need/want to stay in the computer. I was addicted to computers and games in the past and I believe that hardcore features like locking the user out are more a pain in the ass than useful. Addicts just need a good timeout to get it out of their system, they're not slaves they don't need a leash.

xidletime show user idleness without root and apparently is reliable. And I can write a daemon in Python to transform that into a temporal series showing user activity. InfluxDB is perfect to store and explore temporal series but not something expected to be installed in a user desktop so I will log the data to CSV files instead and maybe write a plugin for InfluxDB. I am overengineering this but I want to show user activity in a beautiful detailed timeline. Daily data should have high resolution but older data can be aggressively downsampled and writes aggressively reduced by transforming it in memory before writing.

TODO: Prototype in Python that calls xidletime, transform input and store temporal data of user activity as CSV. +later #python 

# Install
Just run the **setup** script to install it in your home. Dependencies are **ripgrep**, **fzf**, **bat**.

TODO: AUR build script. +later #arch


# Development
This project is under active development and still in it's infancy. Contributors and feedback are welcomed. 

