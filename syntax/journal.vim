" Vim syntax file for Journal
" Language:	Markdown
" Maintainer: danisztls
" URL:

syn match todoLine "^TODO:"
syn match todoAsap "+asap"
syn match todoLater "+later"
syn match todoDone "+done"
syn match todoDate "=[0-9-]\+"
syn match todoContext "\s#[a-zA-Z0-9]\+"
syn match todoPerson "\s@[a-zA-Z0-9]\+"

hi todoLine ctermfg=LightGray guifg=LightGray
hi todoAsap ctermfg=Red guifg=Red
hi todoLater ctermfg=Magenta guifg=Magenta
hi todoDone ctermfg=Green guifg=Green
hi todoDate ctermfg=Cyan guifg=Cyan
hi todoContext ctermfg=Yellow guifg=Yellow
hi todoPerson ctermfg=Blue guifg=Blue

