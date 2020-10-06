if exists("b:current_syntax")
    finish
endif
let b:current_syntax = "atm"

syntax match atmComment "#.*$"
highlight def link atmComment Comment

syntax match atmFunction "^\s*\w\+\s"
highlight def link atmFunction Function

syntax match atmLabel "\w*\:"
highlight def link atmLabel PreProc
