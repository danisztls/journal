#!/bin/bash
# Unitary tests for Journal

# We can't write unit tests for interactive behaviour interacting with external software.
# But we can compare commands strings for a range of inputs to see if they match with what we expect.

# Utils 
# -----
export journalTesting="true"

reset='\e[0;0m'
bold='\e[1m'
dim='\e[2m'
italic='\e[3m'
blink='\e[5m'
red='\e[1;31m'
green='\e[1;32m'

  # Diff two strings
_diff() {
  # use delta if available
  if command -v delta &>/dev/null; then
    delta <(echo "$expected") <(echo "$observed")

  else
    # FIXME: Working on shell but not on script (maybe zsh only)
    # diff --color=always -d <(<<< "$expected") <(<<< "$observed")
    diff --color=always -d <(echo "$expected") <(echo "$observed")
  fi
}

# Print a report of the test
_report() {
  local status="$1"

  if [ "$status" -eq 0 ]; then
    hits+=1
    printf "[${green}PASS${reset}]: %s\n" "'$cmd'"

  elif [ "$status" -eq 1 ]; then
    misses+=1
    printf "[${red}FAIL${reset}]: %s\n" "'$cmd'"
    _diff

  else
    printf "${red}ERROR: Wrong status code for %s.${reset}\n" "$cmd"
  fi
}

# Check if observations pass expectations
_test() {
  local cmd expected observed
  cmd="./journal ${name} -a"
  observed="$($cmd)" # read stdout of command to variable
  expected="$(< "./test/${name}.txt")" # read contents of file to variable

  if [ "$observed" = "$expected" ]; then
    _report 0
  else
    _report 1
  fi
  
  # shellcheck disable=SC2154
  if [ "$journalTestDebug" == "true" ]; then
    mkdir -p "./test-debug"
    echo "$observed" > "test-debug/${name}.txt" 
  fi
}

# Tasks
# -----
testPrint() {
  local name # pass variables by reference
  name="print"
  _test
}

testShow() {
  local name # pass variables by reference
  name="show"
  _test
}

testFind() {
  local name # pass variables by reference
  name="find"
  _test
}

# TODO: Implement testCommit()

# Log
# ---

# TODO: Implement testWrite()

# TODO: Implement testRead()

# TODO: Implement testRotate()

# Main 
# ----
declare -i hits misses total
hits=0
misses=0
total=0

printf "${italic}%s${blink}%s${reset}\n\n" "Running tests" "..."

testPrint
testShow
testFind

# Show summary
total="$(( hits + misses ))"
printf "\nHIT: ${green}%i${reset} of %i\n" "$hits" "$total"
printf "MISS: ${red}%i${reset} of %i\n" "$misses" "$total"

# Exit w/ error if there are any misses
if [ $misses -gt 0 ]; then
  exit 1
fi
