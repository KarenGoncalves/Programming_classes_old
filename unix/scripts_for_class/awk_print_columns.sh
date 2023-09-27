#!/bin/sh

# Print second column of the file blastp_results.txt
awk '{print $2}' blastp_results.txt
# Print second and third columns of the file blastp_results.txt
awk '{print $2,$3}' blastp_results.txt
