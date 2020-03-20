#!/bin/bash
set -e
export no_proxy=`cat /etc/hosts  | tail -1 | awk '{print $1}'`
cd /fate/fate_flow
python fate_flow_server.py
exec "$@"
