---
title: "Class 3 - Running Jobs"
author: "Karen Cristine Goncalves"
date: "2023-01-30"
output:
    ioslides_presentation:
        incremental: true
---

<style>
.code {
background-color: grey;
color: black
}

p, li {
line-height: 1.1em;
font-size: 0.75em;
word-wrap: true
}
</style>

## Run jobs 

Cannot run/execute any of those commands from ` ~ `

The three possibilities:

- `srun` - Use to submit a script to be executed in real time (the process of running the job will be printed in the screen instead of saved into a file)
- `sbatch` - Use to submit a script to be executed later
- `salloc` - Use to `alloc`ate resources for a job in real time. 
	- Basically, you ask for memory and CPUS  for a determinate amount of time and when the "allocate" the resources to you, you work in real time in a computer more potent than yours.



## Run jobs - srun 

<span class="code">`srun NEEDED_INFO script/command`</span>

- Before running `srun`, need to load software required need to the session 
	- Adding `module load software` to the script does not work
- Information needed
	- <span class="code">`--account=acount_name`</span>  -  <span class="code">`def-laboidp`</span>  or  <span class="code">`def-desgagne`</span>  or  <span class="code">`def-germain1`
	- <span class="code">`--time=d-HH:MM:SS`</span> - time required for the script, eg. 12hs: `--time=12:00:00`
	- <span class="code">`--mem=1G`</span> - memory required (here, 1G, default 254M)

## srun - exammple 

### <b>
<div class="code">
```
module load StdEnv/2020 blast+ # load the softwares
cd $SCRATCH

srun --account=def-desgagne --time=01:00:00 --mem=1024M\
 blastp -query prots.fasta\
 -db $myDatabase\
 -out prots_Databased.txt\
 -outfmt '7' # output in table format
```
</div></b>

- The file ` prots.fasta ` is in the current folder, or its path is given in full
	- same for the output ` prots_Database.txt `
- When you use ` \ ` to separate one command in several lines, add a space in the next line to separate the words
## Note on blast

- ` $myDatabase ` 
	- Add the full path, without the extension
	- Use right type of database (the first letter of the extension indicates the type of database)
		- ` .p* ` - protein database
		- ` .n* ` - nucleotide database

## Run jobs - sbatch 


<span class="code">`sbatch script`</span> or <span class="code">`sbatch NEEDED_INFO script`</span> 
- Used to submit a script to be executed later.
- Essentials for the script:
	- First line indicates the program that translates the script to computer language: <span class="code">`#!/bin/sh`</span>
	- Lines starting with `#SBATCH` tell the scheduler what we need for this job
	
## sbatch - script example

### <b>
<div class="code">
```
#!/bin/sh
#SBATCH --account=def-desgagne
#SBATCH --time=01:00:00 
#SBATCH --mem=1024M

module load StdEnv/2020 blast+

myDatabase=/database/path

cd $SCRATCH

blastp -query prots.fasta\
 -db $myDatabase\
 -out prots_Databased.txt\
 -outfmt '7' # output in table format
```
</div></b>

- 
## Run jobs - sbatch 

- salloc - <span class="code">`salloc NEEDED_INFO`</span> 
	- Used to allocate resources for a job in real time. 
	- Basically, you ask for memory and CPUS  for a determinate amount of time and when the "allocate" the resources to you, you work in real time in a computer more potent than yours.

## Resources

- [How to run jobs](https://docs.alliancecan.ca/wiki/Running_jobs)
