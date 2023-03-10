#!/bin/sh

# Print lines containing "#" in blastp_results.txt
awk '/#/ {print}' blastp_results.txt

# Print lines containing "#" in blastp_results.txt
awk '!/#/ {print}' blastp_results.txt
