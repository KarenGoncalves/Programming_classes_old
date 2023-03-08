#!/bin/sh

### Variables ###
myQuery=$1
database=$2
output=$3
scriptName=$4

## Create script ##
echo '#!/bin/sh
#SBATCH --time=00:10:00
#SBATCH --mem=2G

module load StdEnv/2020 gcc/9.3.0 blast+

blastp -query' $myQuery '\
 -db' $database '-outfmt 7\
 -out' $output > $scriptName
 
## Give permissions ##
chmod u=rwx $scriptName
