#!/bin/bash
# Unitary tests for Journal
# We can't write unit tests for interactive behaviour interacting with external software.
# But we can compare commands strings for a range of inputs to see if they match with what we expect.

#-----#
# LIB #
#-----#
export journalTesting="true"

reset='\e[0m'
#bold='\e[1m'
red='\e[1;31m'
green='\e[1;32m'

_diff() {
# Diff two strings
# variables are passed by reference
    # use delta if available
    if command -v delta &>/dev/null; then
        delta <(echo "$exp") <(echo "$obs")
    else
        # FIXME: Work on shell but not on script
        # diff --color=always -d <(<<< "$exp") <(<<< "$obs")
        diff --color=always -d <(echo "$exp") <(echo "$obs")
    fi
}

_report() {
# Print a report of the test
# variables are passed by reference
    local status="$1"
    if [ "$status" -eq 0 ]; then
        printf "[${green}PASS${reset}]: %s\n" "'$name'"
    elif [ "$status" -eq 1 ]; then
        printf "[${red}FAIL${reset}]: %s\n" "'$name'"
        _diff
    else
        printf "${red}ERROR: Wrong status code for %s.${reset}\n" "$name"
    fi
}

_test() {
# Check if observations pass expectations
# variables are passed by reference
    if [ "$obs" = "$exp" ]; then
        _report 0
    else
        _report 1
    fi
}

#-------#
# TASKS #
#-------#
# PRINT
testPrint() {
    local name; local exp; local obs
    name="journal print -a"
    exp="$(< "test/print.txt")" # read contents of file to variable
    # shellcheck disable=SC2086
    obs="$(./$name)" # read stdout of command to variable
    _test
}

# SHOW

# FIND

# COMMIT (later)

testPrint

#-----#
# LOG #
#-----#
# WRITE (later)

# READ (later)

# ROTATE (later)
