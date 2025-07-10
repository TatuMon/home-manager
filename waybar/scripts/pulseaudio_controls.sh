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
  mute-source)
    for src in $(pactl list short sources | awk '{print $2}'); do
      pactl set-source-mute "$src" toggle
    done
    ;;
  switch-sink)
    # Get full sink names, one per line
    mapfile -t sinks < <(pactl list short sinks | awk '{print $2}')
    # Get current default sink's full name
    current_sink=$(pactl get-default-sink)
    # Find index of current sink
    for i in "${!sinks[@]}"; do
        if [[ "${sinks[$i]}" == "$current_sink" ]]; then
            idx=$i
            break
        fi
    done
    # Calculate next sink index, looping back to 0
    next_idx=$(( (idx + 1) % ${#sinks[@]} ))
    # Set new default sink
    pactl set-default-sink "${sinks[$next_idx]}"
    ;;
  switch-source)
    # Get full source names, one per line
    mapfile -t sources < <(pactl list short sources | awk '{print $2}')
    # Get current default source's full name
    current_source=$(pactl get-default-source)
    # Find index of current source
    for i in "${!sources[@]}"; do
        if [[ "${sources[$i]}" == "$current_source" ]]; then
            idx=$i
            break
        fi
    done
    # Calculate next source index, looping back to 0
    next_idx=$(( (idx + 1) % ${#sources[@]} ))
    # Set new default source
    pactl set-default-source "${sources[$next_idx]}"
    ;;
esac
