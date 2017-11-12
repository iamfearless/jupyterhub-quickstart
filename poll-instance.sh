#!/bin/bash

set -x

SERVICE=$1
NAME=$2

PODS=`oc get pod --selector notebook=$NAME -o 'jsonpath={.items[?(@.status.phase=="Running")].metadata.name}'`

if [ x"$PODS" != x"$NAME" ]; then
    exit 1
fi
