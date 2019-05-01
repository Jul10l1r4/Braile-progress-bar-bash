#!/usr/bin/env bash

# Replace value of chars
# for diferents effects:
# Var. | Val.
# -----------
# chars='\|/'
# chars='-+'
# chars='_-='
# chars='$#&'
chars='⡿⣟⣯⣷⣾⣽⣻⢿'
sc=0
animate() {
   printf "\r\b${chars:sc++:1} $1 "
   ((sc==${#chars})) && sc=0
}

# Call function with example:
# . You/path/module/load.sh
# ...
# _load "Messagem for print" "python3 app.py"
_load(){
  while :;do
    animate "$1"
  done & trap "kill $!" EXIT
  eval "$2"
  kill $! && trap " " EXIT 
}

