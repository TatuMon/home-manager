#! /usr/bin/env bash

layout=$(localectl status | awk 'NR==2 {print $3}')

echo " $layout"
