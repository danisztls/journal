<!-- TOC GitLab -->

- [Design](#design)
- [Nexus](#nexus)
	- [Fuzzy finder](#fuzzy-finder)
- [Journal](#journal)
	- [Todo syntax for Markdown](#todo-syntax-for-markdown)
		- [Highlightining](#highlightining)
	- [Diary](#diary)
	- [Planner](#planner)
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


## Fuzzy finder
To quickly find, preview and edit notes I use [fzf](https://github.com/junegunn/fzf) with [ripgrep](https://github.com/BurntSushi/ripgrep) and custom aliases. They are a robust combination that allows me to search files and tasks.

```sh
export FZF_DEFAULT_OPTS="--bind 'f1:execute(nvim {}),f2:execute(xdg-open {}),f3:execute(nautilus {}),f4:execute(ranger {}),f5:execute(echo {} | xclip)' --color=dark --color=fg:-1,bg:-1,hl:#9173eb,fg+:#ffffff,bg+:#2d3444,hl+:#7047eb --color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef"
prev="bat --style=numbers --color=always --line-range :500 {}"
alias 'f=rg -i -t md --files | fzf --preview "$prev"' # markdown files only
```


**Graph**
TODO: Graph, a tool that generates a graph of scopes, notes and their links. It purpose is to aid in reorganizing notes into concise scopes. +later

**Cleaner**
TODO: Cleaner, a script that will search for unlinked assets and send them to trash. +later

**Fixer**
TODO: Fixer, a tool to search for broken links in notes and aid in fixing them. +later

# Journal
Journal is a tool to manage tasks, to keep track of what is to be done and what is done.

**Management**

TODO: Binds in fuzzy to edit tasks and cycle between priorities tags. +asap

**Notification**


TODO: Stateless task notification functionality using libnotify and Gnome calendar. +asap






## Todo syntax for Markdown
**Priority**
- `+asap`
- `+later`

**Time-related**
- `=20-07-30` **at** date
- `>20-07-30` **wait** for date
- `!20-07-30` **until** date

Template variables for date: *monthly, weekly, daily, january, monday, day12* 

**Context**

`#house #linux`

**People**

`@lbcnz`


### Highlightining
Sublimes highlighting is done through a syntax files that attributes scopes to regex matches and a theme files that attributes colors to those scopes.

TODO: Sublime extended markdown todo highlighting for bat.

[Sublime docs](https://www.sublimetext.com/docs/3/syntax.html)

[Oniguruma RE docs](https://raw.githubusercontent.com/kkos/oniguruma/5.9.6/doc/RE)

I wrote the RE matches but the complexity of Sublime metasyntax was too complex for me to grasp in a short amount of time. 

TODO: Vim extended markdown todo highlighting.


## Diary
Diary aids in the management a markdown diary.  Mostly it saves time that would be spent in copy/paste and file naming.

**How to use**
- `diary write` open today's entry in a text editor.
- `diary clean` rotate old entries into monthly/yearly notes.
- `diary read` fuzzy search among entries.

It expects notes saved in **YY-MM-DD.md**, **YY-MM.md** and **YY.md** format and will ignore other files. The default retention policy is 15 days for daily entries and 6 months for monthly entries.


## Planner
Planner, is a tool to organize the backlog, pack tasks into sprints, roadmap projects and see statistics like backlog size and burnout rate.

TODO: Log backlog statistics with every commit. +later

TODO: Graphically explore the backlog statistics. +later


# Eudaemon
Eudaemon is the greek concept of good guardian spirit. It aids the user in seeing clearly his actions and avoiding unhealthy habits like being sitted in the computer for a long period of time.

*Socrates during his lifetime had a daemon that always warned him of threats and bad judgment but never directed his actions.* 

TODO: Daemon that watches for keypresses or mouse movements and notify the user to take a break after extended periods.


# Install
Just run the **setup** script to install it in your home. Dependencies are **ripgrep**, **fzf**, **bat**.

TODO: AUR build script. +later


# Development
This project is under active development and still in it's infancy. Right now I'm looking to write code to view tasks in a calendar and be notified about them following the time-related tags syntax that I propposed above. Contributors are welcome. 

