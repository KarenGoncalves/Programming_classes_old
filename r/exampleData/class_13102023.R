#### Install and load the packages ####
pkgs = c("tidyverse", "readxl")
pkgs.To.Install = ! pkgs %in% installed.packages()
if (any(pkgs.To.Install)) {
	install.packages(pkgs[pkgs.To.Install])
}

for (curPkg in pkgs) {
	library(curPkg, character.only = T) 
}


myFile = "https://karengoncalves.github.io/Programming_classes/r/exampleData/Class1_exampleData.txt"
rawData = read.delim(myFile)
names(rawData)
names(rawData)[1] = "Measured"

longData = pivot_longer(
	data = rawData,
	cols = !Measured, # gets all the columns of the table, except for the one in front of !
	names_to = "Replicates", # name of the column that will contain column names from rawData
	values_to = "Measurements", 
	values_transform = as.numeric
)

str(longData)

ggplot(longData, aes(x = Replicates, y = Measurements)) +
	#	geom_violin() + 
	geom_boxplot() +
	theme_classic()


# pattern is what separates (_)
# i is the part that we want to see: Control_1 has 2 pieces, i=1 returns "Control"

longDataTreatments = longData %>%
	mutate(Treatment = str_split_i(Replicates, pattern = "_", i = 1),
	       newReplicates = gsub(pattern = "_", replacement = "-", Replicates))

str(longDataTreatments)


plot1 = longDataTreatments %>%
	ggplot(aes(x = Treatment, 
		   y = Measurements, 
		   fill = Measured)) +
	geom_boxplot()
ggsave(filename = "Plots/Boxplot_measurementsByMeasured.pdf",
       plot=plot1,
       height = 8, width = 8)
