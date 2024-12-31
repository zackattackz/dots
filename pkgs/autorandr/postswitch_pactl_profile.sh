#!/bin/sh

pactl list cards | rg -r '$1' -o '(output:hdmi-[a-z0-9-]*)\:.*available\:\syes' | head -n1 | xargs -I _ pactl set-card-profile alsa_card.pci-0000_01_00.1 _
