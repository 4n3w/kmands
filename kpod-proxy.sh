#!/usr/bin/env bash

source klibs.bash

proxy_service() {
  local service
  local port

  check_dependencies

  service=$( kubectl get service -o name | fzf -0 -1 --tac --prompt "type to find the service to proxy> " )
  port=$( kubectl describe service ${service##service/} | grep "Port:" | awk '{print $2" "$3}' | fzf -0 -1 --tac --prompt "select the service port to proxy> " )
  selector=$( kubectl describe service rabbitmq | grep Selector | awk '{print $2}')
  pod=$( kubectl get pod --selector=${selector} -o name )
  port=$( echo ${port%%/*} | cut -d ' ' -f 2)

  #Quick and dirty, this probably only works for TCP
  echo "Proxying ${service} via pod ${pod} for port ${port}... "
  kubectl port-forward ${pod##pod/} ${port}
}

proxy_service
