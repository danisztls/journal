Workshop is a place to organize your life and get things done. It is an agnostic approach to note management and personal organization integrated to the desktop and console environments.

*Workshop is a great name but the term is overused in software development culture. An alternative a have in mind is Forge.*

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

**Graph** is a tool that generates a graph of scopes, notes and their links. It purpose is to aid in reorganizing notes into concise scopes.

LATER: Develop Graph.

**Cleaner** is a script that will search for unlinked assets and move them to a trash dir.

LATER: Develop Cleaner.

**Fixer** will search for broken links in md notes and make it easier to fix them.

LATER: Develop Fixer.

# Journal
Journal is a tool to manage tasks and archive their creation and completion history. To keep track of what is to be done and what is done.

Tasks types:
- ASAP
- TODO
- LATER
- WAIT
- ROUTINE

LATER: Implement a review functionality during commit.

LATER: Implement a task notification functionality using libnotify.

LATER: Discuss how tasks can be scheduled to calendar.

# Tracker
Tracker is a spinoff of Journal aimed at helping teams or individuals manage their software development tasks.

Journal is lacking the ability to reorder tasks in the backlog into a prioritized list, to assign owners and deadlines. Most project management solutions for an understandable but not adequate reason overengineer these functions into big and complex frontend/backend systems. While those have a long list of functionalities and a pretty interface they are a pain in the ass. Development should't be managed from a ivory tower but from the code itself and that's the value delivered by this tool: project management in the code itself with a git like tool.

I propose a natural language syntax to assign deadlines and owners to the tasks:

`TODO: Do something @owner lobocnz @until 10/07 @id I2 @tag frontend`

TODO: Adapt Journal script to the Tracker scope.

LATER: Develop the extended syntax functionality.

# Eudaemon
Eudaemon is the greek concept of good guardian spirit. It aids the user in seeing clearly his actions and avoiding unhealthy habits like being sitted in the computer for a long period of time.

*Socrates during his lifetime had a daemon that always warned him of threats and bad judgment but never directed his actions.* 

LATER: Develop Eudaemon.

