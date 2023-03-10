#!/bin/sh

awk 'NR > 1 {print}' blastp_results.txt
will print all but the first line
awk 'NR == 1 {print $1} NR > 1 {print $2}' blastp_results.txt
