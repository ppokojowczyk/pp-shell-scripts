#!/bin/bash
source=$1
format=elf64
echo "nasm -f $format $source.asm"
exit
ld -o $source $source.o -m $format
chmod + $source
./$source
