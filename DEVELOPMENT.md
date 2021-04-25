
<!-- TOC GFM -->

* [Present](#present)
* [Future](#future)
  * [Librarian](#librarian)
* [Ideas](#ideas)
  * [Master](#master)
  * [Cleaner](#cleaner)
  * [Graph](#graph)
  * [Planner](#planner)
  * [Nexus](#nexus)
  * [Eudaemon](#eudaemon)
  * [Sublime highlighting](#sublime-highlighting)
  * [Tracker](#tracker)

<!-- /TOC -->

## Present
Features
- Optionally check files other than .md

Bugs
- Vim TODO syntax is conflicting with [vim-markdown](https://github.com/plasticboy/vim-markdown)

Docs
- Compare it with similar software.

## Future
I started this as a fun project to improve my knowledge of Shell scripting. I liked it and I have a lots of ideas of how I can improve it, make it more useful and friendly. But I will do that in a new Python code base. It wil be more sane, easier to add new features, better to debug and mantain and will support a larger base of users as Python can run everywhere. As such I will retain myself to fixing bugs and doing minor improvements to the Shell script.

### Librarian
Librarian traverse directories, crawl notes for URLs and archive them.

As there are mature tools for web archiving, like [ArchiveBox](https://github.com/ArchiveBox/ArchiveBox), Librarian will limit itself to the extract, integrate and do housekeeping like garbage collection.

ArchiveBox can be installed with Docker and used programatically
```sh
# add pages
archivebox add < urls.txt            
# remove pages
archivebox remove --yes --delete < urls.txt
# refetch: I guess it does it automatically
```
Check:
- [CLI Usage](https://github.com/ArchiveBox/ArchiveBox/wiki/Usage#CLI-Usage) 
- [Python API Reference](https://docs.archivebox.io/en/latest/archivebox.html)

## Ideas
### Master
Extract TODOs from Git deltas so to:
- Calculate burnout chart
- Display changes in a timeline 

### Cleaner
A tool to search for broken links in notes and aid in fixing them.

### Graph
Graph, a tool that generates a graph of scopes, notes and their links. It purpose is to aid in reorganizing notes into concise scopes.

### Planner
Planner, is a tool to organize the backlog, pack tasks into sprints, roadmap projects and see statistics like backlog size and burnout rate. I want to log backlog statistics with every commit and allow it to be graphically explored.

### Nexus
Nexus is the Latin radical for conciseness. It is a document management system with the goal to seamless integrate three core functions: archive, discover and provide. **Archive** means that the system should store and version the documents. **Discovery** means that the user should be able to find the right documents through context or search. **Provide** means that the user can view/edit documents and share them with others easily.

In practical terms notes metadata can be inserted in YAML headers while notes can be exported to practically any format using Pandoc and easily published with Jekyll.

### Eudaemon
Eudaemon is the Greek concept of good guardian spirit. It aids the user in seeing clearly his actions and avoiding unhealthy habits like use the computer for a long period of time. *Socrates during his lifetime had a daemon that always warned him of threats and bad judgment but never directed his actions.* 

I dislike micromanagement and obtrusive software. I believe that hardcore features like locking the user out are more a pain in the ass than an useful feature as power users can circumvent any such features and sometimes you really need to stay in the computer. People just need a good timeout to get the addiction out of their systems, they don't need a leash.

In practical terms:

- libnotify is trivial to implement and Gnome Shell have a do not disturb feature if the user really need/want to stay in the computer.
- xidletime show user idleness without root and apparently is reliable. And I can write a daemon in Python to transform that into a temporal series showing user activity.
- TSDBs are perfect to store and explore temporal series but not something expected to be installed in a user desktop so I will log the data to CSV files instead and maybe write a plugin for InfluxDB or other TSDB to show user activity in a beautiful detailed timeline. Daily data should have high resolution but older data can be aggressively downsampled while writes can be aggressively reduced by transforming them in memory before writing.

### Sublime highlighting
Bat uses Sublime's highlighting syntax as many other text tools. Highlighting in Sublime is done through a syntax file that attributes scopes to regex matches and a theme file that attributes colors to those scopes.

[Sublime docs](https://www.sublimetext.com/docs/3/syntax.html)

[Oniguruma RE docs](https://raw.githubusercontent.com/kkos/oniguruma/5.9.6/doc/RE)

### Tracker
**Tracker** is aimed at helping teams or individuals manage their software development tasks.

Most project management solutions, from an understandable but not adequate reason, overengineer these functions into big and complex frontend/backend systems. While those have a long list of functionalities and pretty interfaces they are innefectual and a pain in the ass to use.

Development should't be managed from a ivory tower but from the code itself and management tasks should not take time from development tasks. The value delivered by this tool is development management in the code itself with a git-like tool.
