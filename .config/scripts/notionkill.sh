#!/bin/bash
ps -elf | grep notion | awk '{print $4}' | head -n 1 | xargs kill -9
