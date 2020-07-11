Workshop is a place to organize your life and get things done. It is an agnostic approach to note management and personal organization integrated to the desktop and console environments.

*Workshop is a great name but the term is overused in software development culture. An alternative a have in mind is Forge.*


<!-- TOC GitLab -->

- [Design](#design)
- [Nexus](#nexus)
- [Journal](#journal)
	- [Agile flow](#agile-flow)
	- [In development](#in-development)
		- [Tags](#tags)
		- [Other](#other)
- [Diary](#diary)
- [Eudaemon](#eudaemon)

<!-- /TOC -->

# Design
**Design principles**

- Bottom-up approach. Tools that already exists should be reused. It's a waste to reinvent the wheel and old technologies that proved to be effective and reliable generally have richer ecossystems and bigger chance of survival through ages than their newer counterparts *(Lindy effect)*.
- Form follows function. Technologies are tools developed by us to enable us to do things better and easier. The effectiveness, efficiency and reliability of the tool is all that matters.
- Minimalism. The problem should be reduced to a small set of use cases for which value delivering is self-evident. Unjustifiable complexity leads to waste and bad design.
- Agnosticism. Systems should be able to interoperate. Needs come and go and so do their associated tools. Retooling is a big waste of time and should be avoided or mitigated.

**System design**

- Everything is inside the workshop dir be it notes, assets or source code.
- Scopes are subdirectories that contain related notes. File systems are hierarchical and we are sticking with it.
- Notes are short named [markdown](markdown.md) files inside scopes and thus can be viewed and edited in any text editor.
- Tasks are lines demarked by placeholders in notes. 
- Assets are images, pdfs and other documents contained in a single hidden folder and linked inside notes.
- External scripts functions as glue and add automation and extra functionality.

# Nexus
Nexus is the Latin radical for conciseness. It is a document management system with the goal to seamless integrate three core functions: archive, discover and provide. Archive means that the system should store and version the documents. Discover means that the user have a way to find the right documents through context or search. Provide means that the user can view/edit documents and share them with others easily.

Notes are saved in Markdown and metadata inserted in a YAML header. That means they can be edited in any text exitor, exported to almost any format using Pandoc and easily published with Jekyll.

TODO: Develop Graph, a tool that generates a graph of scopes, notes and their links. It purpose is to aid in reorganizing notes into concise scopes. +later

TODO: Develop Cleaner, a script that will search for unlinked assets and move them to a trash dir. +later

TODO: Develop Fixer, a tool to search for broken links in md notes and aid in fixing them. +later

# Journal
Journal is a tool to manage tasks and archive their creation and completion history. To keep track of what is to be done and what is done.

TODO: Develop a vim [syntax](http://vimdoc.sourceforge.net/htmldoc/options.html#'syntax') plugin to highlight tasks.

## Agile flow
I try to commit everyday first work thing in the morning. It's a moment where I review what I have accomplished, what I have to do and what I plan to do in the day. Journal commits synthesizes yesterday's work and today's expectations.

Find a tradeoff between micromanaging and not managing at all where the user can get things done with low effort. 

>We are uncovering better ways of developing software by doing it and helping others do it. Through this work we have come to value:
>
>- Individuals and interactions over processes and tools
>- Working software over comprehensive documentation
>- Customer collaboration over contract negotiation
>- Responding to change over following a plan
>
>That is, while there is value in the items on the right, we value the items on the left more.
The [Agile Manifesto](https://agilemanifesto.org)

## In development
Right now Journal is lacking the ability to reorder tasks in the backlog into a prioritized list, to assign deadlines and view them in a calendar.

### Tags
**Priority**
- `+asap`
- `+later`
- `+done`

**Time-related**
- `=20-07-30` notify at date
- `>20-07-30` wait date to notify
- `<20-07-30` notify until date with increasingly urgency

Template variables: *monthly, weekly, daily, january, monday, day12* 

**Context**

`#house #linux`

**People**

`@lbcnz`

TODO: Develop a tags parser. It should input a tasks lists and output per line the task and it's tags as strings of arrays arguments.

**Notification**

TODO: Implement a task notification functionality using libnotify.

I can create asynchronous event calls or periodically parse for possible events and notify on match. The latest is simpler. 

Right now the program don't know the difference between updates and insertions/deletes and effemeral tasks, tasks that are created and deleted in the same iteration, don't get commited. As it's not desired to serialize and store the tasks in a separate database a solution to these problems is non conventional. It seems to me that the best is to change the user flow. Instead of deleting the tasks the user could mark them as completed with `+done`. And instead of diffing the current list of tasks with a previously commited one the program could look for the `+done` tag and append those tasks to a journal file and them delete them inside their files. The tradeoff of this approach is the loss of accounting of changes in the backlog but there are workarounds for that as counting the size of the backlog in every commit. This new approach is great because it's truly stateless if you don't account for the markdown files and todos that will exist anyway.

TODO: Write a new commit function that logs and deletes tasks tagged with done tag. +asap

TODO: Count and log the backlog delta every commit. +asap 

TODO: Colorize status tags. +done

### Other
Planner, a tool to reorder tasks into prioritized, pack them into sprints and roadmap projects.

*[Tracker](tracker.md) is a spinoff of Journal aimed at helping teams or individuals manage their software development tasks. After Journal is mature I intend to adapt it to this new use case.*

# Diary
Diary is a tool to aind in the management a markdown diary. It moves entries to consolidated monthly/yearly entries following a retention policy.

# Eudaemon
Eudaemon is the greek concept of good guardian spirit. It aids the user in seeing clearly his actions and avoiding unhealthy habits like being sitted in the computer for a long period of time.

*Socrates during his lifetime had a daemon that always warned him of threats and bad judgment but never directed his actions.* 

TODO: Develop a simple daemon that watches for keypresses or mouse movements and notify the user to take a break after extended periods. +later

