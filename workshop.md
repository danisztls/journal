Workshop is a place to organize your life, your projects and get things done. It is an agnostic approach to note management and personal organization integrated to the desktop environment.

*Workshop is a great name but it is overused in software development culture. A alternative a have in mind is Forge.*

# Design
Principles
- Bottom-up approach. Reuse what already exists. It's a waste to reinvent the wheel and old technologies that proved to be effective and reliable generally have richer ecossystems and bigger chance of survival than their newer counterparts.
- Form follows function. Technologies are tools developed by us to enable us to do things better and easier. The effectiveness, efficiency and reliability of the tool is all that matters.
- Minimalism. Reduce the problem to a small set of use cases for which value delivering is self-evident. Unjustifiable complexity leads to loss of focus and waste.
- Agnosticism. Systems should be able to interoperate. Needs come and go and so do their associated tools. Retooling is a big waste of time.

Architecture
- Everything is inside the workshop dir be it notes, assets or source code.
- Scopes are subdirectories that contain related notes. File systems are hierarchical and we are sticking with it.
- Notes are short named [markdown](markdown.md) files inside scopes and thus can be viewed and edited in any text editor.
- Tasks are lines demarked by placeholders in notes. 
- Assets are images, pdfs and other documents contained in a single hidden folder and linked inside notes.
- External scripts functions as glue and add automation and extra functionality.

# Nexus
Nexus is the latin radical for conciseness and a document management system. The goal is to seamless integrate three core functions: archive, search and provide. Archive means that the system should store and version the documents. Search means that users have a way to discover the right documents through context. And provide means that users can view/edit documents and share them with collaborators. Notes are saved in Markdown and metadata inserted in a YAML header. That means they can be edited in any text exitor, exported to almost any format using pandoc and easily published with Jekyll.

LATER: Develop Graph.
Graph is a tool that generates a graph of scopes, notes and their links. It purposes is to aid in reorganizing notes into concise scopes.

LATER: Develop Cleaner.
Cleaner is a script that will search for unlinked assets and move them to a trash dir.

LATER: Develop Fixer.
Fixer will search for broken links in md notes and make it easier to fix them.

# Journal
Journal is a tool to manage tasks and archive their creation and completion history. To keep track of what is to be done and what is done.

Tasks types:
- ASAP
- TODO
- LATER
- WAIT
- ROUTINE

LATER: Implement a review functionality during commit.
Also only lines deleted should be commited. Or not?

LATER: Implement a task notification functionality using libnotify.

LATER: Discuss how tasks can be scheduled to calendar.

# Eudaemon
Eudaemon is the greek concept of good guardian spirit. It aids the user in seeing clearly his actions and avoiding unhealthy habits like being sitted in the computer for a long period of time.

*Socrates during his lifetime had a daemon that always warned him of threats and bad judgment but never directed his actions.* 

LATER: Develop Eudaemon.

