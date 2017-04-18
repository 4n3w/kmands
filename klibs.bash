#!/usr/bin/env bash

check_dependencies(){
    if [[ ! -x "$(which fzf 2>/dev/null)" ]]; then
     echo "Please Install: github.com/junegunn/fzf" >&2
     return 1
    fi
    if [[ ! -x "$(which kubectl 2>/dev/null)" ]]; then
     echo "Please Install: kubectl" >&2
     return 1
    fi
    if [[ ! -x "$(which gshuf 2>/dev/null)" ]]; then
     echo "Please Install: kubectl" >&2
     return 1
    fi
}

