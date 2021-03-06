#!/usr/bin/env bash

source klibs.bash

kns() {
  local current
  local namespace
  local selected

  check_dependencies

  current="$(kubectl config current-context)"
  namespace="$(kubectl config get-contexts "$current" | awk "/$current/ {print \$5}")"

  if [[ -z "$namespace" ]]; then
    namespace="default"
  fi

  selected=$( (kubectl get namespaces -o name | sed "s-namespaces/--" ) | fzf -0 -1 --tac --prompt "Current Namespace $namespace> ")
  if [[ ! -z "$selected" ]]; then
    kubectl config set-context "$current" "--namespace=${selected##namespace/}"
    echo "Set \"$selected\"."
  fi
}

kns
