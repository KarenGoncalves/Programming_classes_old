echo "#!/bin/sh
#SBATCH --time=00:10:00
#SBATCH --mem=2G

module load StdEnv/2020 gcc/9.3.0 blast+

blastp -query "$1" -db "$2" -outfmt 7 -out" $3
