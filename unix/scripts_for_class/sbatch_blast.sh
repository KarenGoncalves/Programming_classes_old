#!/bin/sh
#SBATCH --time=00:10:00
#SBATCH --mem=2G

module load StdEnv/2020 gcc/9.3.0 blast+

blastp -query $HOME/myProtein.fa\
 -db $HOME/database -outfmt 7\
 -out $HOME/myBlastResult.txt
