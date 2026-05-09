#!/bin/bash
# Zabija poprzednią instancję jeśli istnieje
pkill -f pulse-popup.py 2>/dev/null
python3 ~/.config/scripts/pulse-popup.py &
