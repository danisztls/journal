# Now
Things that I want to implement in this cycle of development.

## Lessons learned
I used Journal exclusively to organize my life and I found some shortcomings:

- asap priority is not enough, urgent, important and critical (urgent + important) is better.
- task management should be integrated with daily logging.

TODO: Modify Journal to use new priorities.
TODO: Review how logs are done.
TODO: Merge/integrate *diary* with *journal*.

## Reminders
Reminder is a minimalistic cli calendar and reminder tool. It can work alongside Journal.

TODO: Write Awk script to export tasks to Reminder format.

Reminder syntax examples:

```
REM Jan 1 MSG Remind every year on new years day
REM January 1 2015 MSG Remind only on new years day 2015
REM Sunday 2 MSG Remind every second Sunday
REM March Monday 1 --7 MSG remind on the last Monday of February
REM December 25 +30 MSG Christmas
```

## Similar tools
Todo.txt, org-mode and taskwarrior in what journal is different and maybe better than them? What they do better?

TODO: Review and write a comparison between tools.

# Future
Some ideas I have for the future after Journal is mature/stable enough.

## Fixer/Cleaner
Fixer, a tool to search for broken links in notes and aid in fixing them.
Cleaner, a tool to search for unlinked assets and aid in fixing/trashing them.

## Sublime highlighting
Bat uses Sublime's highlighting syntax as many other text tools. Highlighting in Sublime is done through a syntax file that attributes scopes to regex matches and a theme file that attributes colors to those scopes.

[Sublime docs](https://www.sublimetext.com/docs/3/syntax.html)

[Oniguruma RE docs](https://raw.githubusercontent.com/kkos/oniguruma/5.9.6/doc/RE)

## Graph
Graph, a tool that generates a graph of scopes, notes and their links. It purpose is to aid in reorganizing notes into concise scopes.

## Planner
Planner, is a tool to organize the backlog, pack tasks into sprints, roadmap projects and see statistics like backlog size and burnout rate. I want to log backlog statistics with every commit and allow it to be graphically explored.

## Nexus
Nexus is the Latin radical for conciseness. It is a document management system with the goal to seamless integrate three core functions: archive, discover and provide. **Archive** means that the system should store and version the documents. **Discovery** means that the user should be able to find the right documents through context or search. **Provide** means that the user can view/edit documents and share them with others easily.

In practical terms notes metadata can be inserted in YAML headers while notes can be exported to practically any format using Pandoc and easily published with Jekyll.

### Eudaemon
Eudaemon is the Greek concept of good guardian spirit. It aids the user in seeing clearly his actions and avoiding unhealthy habits like use the computer for a long period of time. *Socrates during his lifetime had a daemon that always warned him of threats and bad judgment but never directed his actions.* 

I dislike micromanagement and obtrusive software. I believe that hardcore features like locking the user out are more a pain in the ass than an useful feature as power users can circumvent any such features and sometimes you really need to stay in the computer. People just need a good timeout to get the addiction out of their systems, they don't need a leash.

In practical terms:

- libnotify is trivial to implement and Gnome Shell have a do not disturb feature if the user really need/want to stay in the computer.
- xidletime show user idleness without root and apparently is reliable. And I can write a daemon in Python to transform that into a temporal series showing user activity.
- TSDBs are perfect to store and explore temporal series but not something expected to be installed in a user desktop so I will log the data to CSV files instead and maybe write a plugin for InfluxDB or other TSDB to show user activity in a beautiful detailed timeline. Daily data should have high resolution but older data can be aggressively downsampled while writes can be aggressively reduced by transforming them in memory before writing.


