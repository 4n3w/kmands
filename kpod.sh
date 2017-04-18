#!/usr/bin/env bash

source klibs.bash

get_pods_in_namespace() {
  local selected

  check_dependencies

  selected=$( kubectl get pods -o name | fzf -0 -1 --tac --prompt "type to find the pod> ")

  if [[ ! -z "$selected" ]]; then
    kubectl describe pod ${selected##pod/}
  fi
}

get_pods_in_namespace
