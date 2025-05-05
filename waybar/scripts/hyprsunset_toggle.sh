#! /usr/bin/env bash

if [[ -z $(pgrep hyprsunset) ]]; then
    hyprsunset -t 3500 > /dev/null
else
    killall hyprsunset > /dev/null
fi
