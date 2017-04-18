#!/usr/bin/env bash

source klibs.bash

switch_cluster() {
  local current
  local cluster
  local selected

  check_dependencies

  current="$(kubectl config current-context)"
  cluster="$(kubectl config get-contexts "$current" | awk "/$current/ {print \$2}")"
  selected=$( kubectl config get-contexts -o name | fzf -0 -1 --tac --prompt "Current cluster: $current> ")

  if [[ ! -z "$selected" ]]; then
    kubectl config use-context "$selected"
    echo "Set Cluster Context to \"$selected\"."
  fi
}

switch_cluster
