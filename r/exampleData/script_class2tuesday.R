# start by creating a vector with all the packages you need
pkgs = c("readxl", "tidyverse")

# We check which packages are NOT (!) installed
pkgs.To.Install = ! pkgs %in% installed.packages()

# any() checks if there is at least one TRUE in the vector
if (any(pkgs.To.Install)) install.packages(pkgs[pkgs.To.Install])

for (curPkg in pkgs) library(curPkg, character.only = T) 
# curPkg is a variable that takes the value of each element in pkgs
# Every time the function library() is run, curPkg changes value

myFile = "https://karengoncalves.github.io/Programming_classes/r/exampleData/Class1_exampleData.txt"

rawData = read.delim(myFile)
names(rawData)[1] = "Measured"

longData = pivot_longer(
	data = rawData,
	cols = !Measured, # gets all the columns of the table, except for the one in front of !
	names_to = "Replicates", # name of the column that will contain column names from rawData
	values_to = "Measurements"
)

# pattern is what separates (_)
# i is the part that we want to see: Control_1 has 2 pieces, i=1 returns "Control"

longDataTreatments = longData %>%
	mutate(Treatment = str_split_i(Replicates, pattern = "_", i = 1))

longDataTreatments %>%
	ggplot(aes(x = Treatment, 
		   y = Measurements,
		   fill = Treatment)) +
	geom_violin(show.legend = F) + 
	geom_point(show.legend = F) 


# Set a theme for all future plots in this session
theme_set(theme_bw()) 

# Use different colors to fill and remove the legend
theme_set(theme_minimal())
colors = c("red", "green", "blue")

ggplot(data = iris,
       aes(x = Species,
           y = Sepal.Length,
           fill = Species)) +
	geom_violin(show.legend = F) + # violin instead of boxplot
	ylab("Sepal length (mm)") +
	xlab("Species epithet") +
	scale_fill_manual(values = colors,
			  breaks = levels(iris$Species)[c(2,3,1)])

#### Group and summarise data to calculate mean and stadard deviation
iris %>% group_by(Species) %>%
	summarise(Mean_Sepal.Length = mean(Sepal.Length, na.rm = T),
		  SD_Sepal.Length = sd(Sepal.Length, na.rm = T)) %>%
	ggplot(aes(x = Species)) +
	geom_col(aes(y = Mean_Sepal.Length, fill = Species)) +
	geom_errorbar(aes(ymin = Mean_Sepal.Length - SD_Sepal.Length,
			  ymax = Mean_Sepal.Length + SD_Sepal.Length),
			  width = 0.25, linewidth = 1)


# Barplot like geom_col

df <- data.frame(
	group = c("Male", "Female", "Child"),
	value = c(25, 25, 50)
)

df %>% ggplot(aes(x = "", y = value, fill = group)) +
	# x has to be "" - check how it looks if you put x = group
	geom_bar(width = 1,  stat = "identity") +
	coord_polar("y", start = 0
		    ) +
	theme_void() # clean up grids, borders, and labels


#### Pie chart (just add coord_polar("y", start = 0) )
df %>% ggplot(df, aes(x = "", y = value, fill = group)) +
	# x has to be "" - check how it looks if you put x = group
	geom_bar(width = 1,  stat = "identity") +
	coord_polar("y", start = 0) +
	theme_void() # clean up grids, borders, and labels




