#!/bin/sh
blastp -query $1 -db $2 -outfmt 7 -out $3
