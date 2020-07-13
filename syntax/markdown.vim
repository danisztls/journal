" Additional syntax and highlighting for Journal's Todo Markdown

syn match TODO "^TODO:"
syn match TodoAsap "+asap"
syn match TodoLater "+later"
syn match TodoDone "+done"
syn match TodoDate "[=>!][0-9-]\+"
syn match TodoContext "\s#[a-zA-Z0-9]\+"
syn match TodoPerson "\s@[a-zA-Z0-9]\+"

hi TodoAsap ctermfg=Red guifg=Red
hi TodoLater ctermfg=Magenta guifg=Magenta
hi TodoDone ctermfg=Green guifg=Green
hi TodoDate ctermfg=Cyan guifg=Cyan
hi TodoContext ctermfg=Yellow guifg=Yellow
hi TodoPerson ctermfg=Blue guifg=Blue

