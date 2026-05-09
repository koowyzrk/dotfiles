#!/bin/bash

if pgrep keepassxc >/dev/null; then
  pkill keepassxc
else
  keepassxc &
fi
