#!/bin/bash

#
# Watch dirty memory info.
#
watch -n1 grep -e Dirty: -e Writeback: /proc/meminfo
