#!/bin/bash
case $1 in
  up)
    for sink in $(pactl list short sinks | awk '{print $2}'); do
      pactl set-sink-volume "$sink" +5%
    done
    ;;
  down)
    for sink in $(pactl list short sinks | awk '{print $2}'); do
      pactl set-sink-volume "$sink" -5%
    done
    ;;
  mute)
    for sink in $(pactl list short sinks | awk '{print $2}'); do
      pactl set-sink-mute "$sink" toggle
    done
    ;;
esac
