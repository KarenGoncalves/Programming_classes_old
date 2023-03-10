#!/bin/sh

awk 'BEGIN {RS=">"} {print $1}' myFasta.fasta
