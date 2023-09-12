# Get help for a function (eg. aov - anova)
help("aov") 
?aov

# Create a sequence of numbers and get the mean of the sequence
mean(1:4)

# Load the Example Dataset 

fileName = "https://karengoncalves.github.io/Programming_classes/r/exampleData/Class1_exampleData.txt"
myFirstInput = read.delim(fileName, header = T, row.names = 1)
