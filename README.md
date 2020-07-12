<!-- TOC GitLab -->

- [Design](#design)
- [Nexus](#nexus)
- [Journal](#journal)
	- [Tags](#tags)
	- [Diary](#diary)
	- [Planner](#planner)
	- [Agile flow](#agile-flow)
	- [Tracker](#tracker)
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

To quickly find, preview and edit notes I use fzf with ripgrep and a custom shell alias.

```sh
export FZF_DEFAULT_OPTS="--bind 'f1:execute(nvim {}),f2:execute(xdg-open {}),f3:execute(nautilus {}),f4:execute(ranger {}),f5:execute(echo {} | xclip)' --color=dark --color=fg:-1,bg:-1,hl:#9173eb,fg+:#ffffff,bg+:#2d3444,hl+:#7047eb --color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef"
prev="bat --style=numbers --color=always --line-range :500 {}"
alias 'f=rg -i -t md --files | fzf --preview "$prev"' # markdown files only

```

TODO: Graph, a tool that generates a graph of scopes, notes and their links. It purpose is to aid in reorganizing notes into concise scopes. +later

TODO: Cleaner, a script that will search for unlinked assets and send them to trash. +later

TODO: Fixer, a tool to search for broken links in notes and aid in fixing them. +later

# Journal
Journal is a tool to manage tasks, to keep track of what is to be done and what is done.

TODO: Vim [syntax](http://vimdoc.sourceforge.net/htmldoc/options.html#'syntax') highlight tasks and tags. +asap

TODO: Some tasks are appearing in the wrong file group during show due to the way deduplication is done. +asap #bug

## Tags
**Priority**
- `+asap`
- `+later`
- `+done`

Basically prioritized, non prioritized, deprioritized and completed.

**Time-related**
- `=20-07-30` notify **at** date
- `>20-07-30` **wait** for date to start and notifying
- `<20-07-30` notify **until** date with increasingly urgency

Template variables: *monthly, weekly, daily, january, monday, day12* 

TODO: Stateless task notification functionality using libnotify and Gnome calendar. +asap

**Context**

`#house #linux`

**People**

`@lbcnz`

Tasks showed can be further refined by context or people through tools like grep and less. 

TODO: New commit function that logs and deletes tasks tagged with done tag. +done

TODO: Colorize status tags. +done

## Diary
Diary aids in the management a markdown diary.  Mostly it saves time that would be spent in copy/paste and file naming.

**How to use**
- `diary today` will open today's entry in a text editor.
- `diary clean` will rotate old entries into monthly/yearly notes.

It expects notes saved in **YY-MM-DD.md**, **YY-MM.md** and **YY.md** format and will ignore other files. The default retention policy is 15 days for daily entries and 6 months for monthly entries.

## Planner
Planner, a tool to reorder tasks into a prioritized backlog, pack them into sprints and roadmap projects.

TODO: Easily assign priority tags to tasks. +later
TODO: Log backlog statistics with every commit.
TODO: Graphically explore the backlog statistics. +later

## Agile flow
It's important to find a equilibrium between micromanaging and not managing at all where you can get things done. I try to commit everyday first work thing in the morning. It's a moment where I review what I have accomplished, what I have to do and what I plan to during the day. 

>We are uncovering better ways of developing software by doing it and helping others do it. Through this work we have come to value:
>
>- Individuals and interactions over processes and tools
>- Working software over comprehensive documentation
>- Customer collaboration over contract negotiation
>- Responding to change over following a plan
>
>That is, while there is value in the items on the right, we value the items on the left more.
The [Agile Manifesto](https://agilemanifesto.org)

## Tracker
[Tracker](tracker.md) is a spinoff of Journal aimed at helping teams or individuals manage their software development tasks. After Journal is mature I intend to adapt it to this use case.

# Eudaemon
Eudaemon is the greek concept of good guardian spirit. It aids the user in seeing clearly his actions and avoiding unhealthy habits like being sitted in the computer for a long period of time.

*Socrates during his lifetime had a daemon that always warned him of threats and bad judgment but never directed his actions.* 

TODO: Daemon that watches for keypresses or mouse movements and notify the user to take a break after extended periods.

# Install
Just run the **setup** script to install it in your home. **ripgrep** is a dependency and **fzf** and **bat** are recommended.

# Development
This project is under active development and still in it's infancy. Right now I'm looking to write code to view tasks in a calendar and be notified about them following the time-related tags syntax that I propposed above. 

