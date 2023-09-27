# Get help for a function (eg. aov - anova)
help("aov") 
?aov

#### Load the Example Dataset 
myFirstInput = read.delim("https://karengoncalves.github.io/Programming_classes/r/exampleData/Class1_exampleData.txt", row.names = 1)

# See the beginning and end of the dataset
head(myFirstInput)
tail(myFirstInput)

# See the structure and the summary of the dataset
str(myFirstInput)
summary(myFirstInput)

#### Work with PlantGrowth

# Save the dataset PlantGrowth into your environment
myPlantGrowth = PlantGrowth

# Print the first row and the first column of myPlantGrowth
myPlantGrowth[1,]
myPlantGrowth[,1]

# Change the names of the rows of myPlantGrowth (it has 30 lines)
rownames(myPlantGrowth) = 30:1

# Print the first column maintaining the table format
myPlantGrowth[1]

myPlantGrowth["weight"]

#### Difference between character and factor
myLetters = as.factor(letters)

as.numeric(myLetters)
as.numeric(letters)

### Create graphs

# Simple boxplot
boxplot(iris$Sepal.Length ~ iris$Species)

# Box plot with colors
colors = c("red", "green", "blue")
boxplot(iris$Sepal.Length ~ iris$Species, 
	col = colors)

# Remove the table name from the axes titles
with(iris, boxplot(Sepal.Length ~ Species, col = colors))
# or
boxplot(Sepal.Length ~ Species, col = colors, data = iris)

# Set a new axes titles with x/ylab
colors = c("red", "green", "blue")
boxplot(iris$Sepal.Length ~ iris$Species, 
	col = colors, 
	ylab = "Sepal length (mm)", 
	xlab = "Species epithet")