---
title: "Basic commands"
author: "Karen Cristine Goncalves"
date: "1/26/2023"
output: 
    ioslides_presentation	
---

<style>
.code {
background-color: grey
}
</style>

## Basics

 - Commands are separated by a new line (Enter, Return) or a semicolon (;)
 - The first word in a command is what you are asking the computer to do (a function)
 - Spaces are used to separate file names, commands, etc. 
 - Some commands allow you to customize their output with options
	- These are single letters, a word, or several words preceeded by `-` or `--`
 - You can get help for a command by using the help option (either `-h` , `--help` ) or the command `man` (for manual)
	
### <b>
<div class="code">

`ls --help`

`man ls`
</div>
### </b>

## About spaces and file names

 - Put name in quotes if it has spaces (test code below)

### <b>
<div class="code">

`touch Programming Class.txt`

`ls`

`touch "Programming Class.txt"`

`ls`
</div>
### </b>

 
 - Quotes are NORMALLY (not always) interchangeable  (test code below)

### <b>
<div class="code">

`echo "This is good"`

`echo 'This is good'`
</div>
### </b>

- Do not start with one quote type and end with another

## Shortcuts 	


 - <span class="code">`~` </span>or <span class="code">`$HOME` </span>: your home folder (can be defined by the user)
 - <span class="code">`.`</span> : the folder that you are currently in
 - <span class="code">`..`</span>: the folder that contains the one you are currently in
 - <span class="code">`Ctrl+C`</span>: cancel a command
 - In MobaxTerm, find and modify useful shortcuts by clicking on Settings -> Keyboard shortcuts
 - <span class="code">`whoami`</span>
	- prints your username (if saved in the computer)

## Basic commands

		
 - <span class="code">`cd`</span>
	- acronym for "change directory" (directory = folder)
	- If used alone, opens your home folder
	- The name of the folder to which you want to go comes after `cd` 
		- `cd` , `cd ~` and `cd $HOME` are synonyms
 - <span class="code">`pwd`</span>
	- acronym for "print working directory" (directory = folder)
	- equivalent to the R function `getwd()` or python's `os.getcwd()`
	- prints the full path to your current folder
	- A full path always starts from the root (/)

##  Basic commands

 - <span class="code">`ls`</span>
	- lists the contents of your current folder
	- Check slide 2 where we used this command
 - Use <span class="code">`>`</span> after a command to save the output
	
### <b>
<div class="code">
`pwd > myFolder`

`cat myFolder`
</div>	

### </b>

- Use <span class="code">`>>`</span> to add the current output to a previous file
	
### <b>
<div class="code">
`ls >> myFolder`
	
`cat myFolder`
</div>	
### </b>


## Managing text files

- <span class="code">`cat`</span> : prints the contents of the file to the screen
	- Do not use it with files are that not text (images, pdfs, compressed files) or is too big
	- If several files names are put after the command, one file is printed followed by the next (conCATenation)
- <span class="code">`less`</span> : opens the file as "read-only"
	- Search for a word in a file inside less by typing "/" followed by the word
	- To close less, press Q
- <span class="code">`more`</span> : opens the file as "read-only", when the file is closed, prints it to the screen
- <span class="code">`head`</span> and <span class="code">`tail`</span>: prints to the screen the first/last 10 lines of the file 


## Managing text files

- <span class="code">`nano`</span> : open a text file to edit it.
- <span class="code">`grep`</span> : searches for a word/phrase in the file and prints the lines that match
	- Can search for several phrases (one per line) in a file by using the option `-f`
	- If you don't care about the upper/lower case, use the option `-i` or `--ignore-case`
- <span class="code">`wc`</span> : word count. Counts the number of characters, words and lines in a file
- <span class="code">`echo`</span> : repeats the text that follows it
