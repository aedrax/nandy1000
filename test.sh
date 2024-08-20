#!/bin/bash

# Check if the filename is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

FILENAME=$1

# Compile the Verilog file
iverilog -g2012 -o test $FILENAME

# Run the compiled simulation
vvp test

# Remove the generated files
rm test
rm dump.vcd
