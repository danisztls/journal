#!/bin/bash
# Unitary tests for Journal
# We can't write unit tests for interactive behaviour interacting with external software.
# But we can compare commands strings for a range of inputs to see if they match with what we expect.

#-----#
# LIB #
#-----#
export journalDebug="true"

reset='\e[0m'
#bold='\e[1m'
red='\e[1;31m'
green='\e[1;32m'

_report() {
    # $name is passed by reference
    local status="$1"
    if [ "$status" -eq 0 ]; then
        printf "[${green}PASS${reset}]: %s\n" "$name"
    elif [ "$status" -eq 1 ]; then
        printf "[${red}FAIL${reset}]: %s\n" "$name"
    else
        printf "${red}ERROR: Wrong status code for %s.${reset}\n" "$name"
    fi
}

# ----- #
# TASKS #
# ----- #
# PRINT
testPrint() {
    local name="journal print -a"
    local exp=
    local obs; obs="$(../journal print -a)"

    # Do observations pass expectations?
    if [ "$obs" = "$exp" ]; then
        _report 0
    else
        _report 1
        diff <(echo "$exp") <(echo "$obs")
    fi
}
# SHOW

# FIND

# COMMIT (later)

testPrint

# --- #
# LOG #
# --- #
# WRITE (later)

# READ (later)

# ROTATE (later)
