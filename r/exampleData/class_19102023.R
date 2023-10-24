# start by creating a vector with all the packages you need
pkgs = c("tidyverse")
# We check which packages are NOT (!) installed
pkgs.To.Install = ! pkgs %in% installed.packages()
# any() checks if there is at least one TRUE in the vector
if (any(pkgs.To.Install)) install.packages(pkgs[pkgs.To.Install])
for (curPkg in pkgs) library(curPkg, character.only = T) 

# Set a theme for all future plots in this session
theme_set(theme_bw()) 

# geom_bar() - count number of times each name appears in a column
# Datasets about US states
US_statesInfo = data.frame(Name = state.name,
			   Region = state.region,
			   Division = state.division)
x = "Number of states"
# Plot the number of states in each division
ggplot(US_statesInfo, aes(fill = Division, y = Region)) +
	geom_bar(stat = "count") +
	xlab(x)

# geom_col() - plot specific values from one column associated with the groups in another column
df <- data.frame(
	group = c("Male", "Female", "Child"),
	value = c(25, 25, 50)
)

ggplot(df, aes(x = group, y = value, fill = group)) +
	geom_col() +
	theme_classic()

# Pie chart - a circular bar chart 
ggplot(df, aes(x = "", y = value, fill = group)) +
	geom_col() +
	coord_polar("y", start = 0) +
	theme_void()

# Play with the chart
ggplot(df, aes(x = "", y = value, fill = group)) +
	geom_col() +
	# if you do not specify "x" or "y", ggplot rotates the data on "x"
	coord_polar(start = 0) +
	theme_void()


ggplot(df, aes(x = "", y = value, fill = group)) +
	geom_col() +
	# the start indicates where to start rotating the data
	coord_polar("y", start = 30) +
	theme_void()

# umbrella-like chart
ggplot(df, aes(x = group, y = value, fill = group)) +
	geom_col() +
	coord_polar(start = 0)

#' Edit the theme to remove the panel border, the axes titles, 
#' the ticks and the text in the y axis
ggplot(df, aes(x = group, y = value, fill = group)) +
	geom_col() +
	coord_polar(start = 0) +
	theme(panel.border = element_blank(),
	      axis.title = element_blank(),
	      axis.ticks = element_blank(),
	      axis.text.y = element_blank())

# Save the theme in a variable to reuse it without repeating the code
theme_pie = theme_bw() +
	theme(panel.border = element_blank(),
	      axis.title = element_blank(),
	      axis.ticks = element_blank(),
	      axis.text.y = element_blank())

ggplot(df, aes(x = group, y = value, fill = group)) +
	geom_col() +
	coord_polar(start = 0) +
	theme_pie


#### Line chart ####

# Let's create a time series to plot

LabSize = data.frame(Isabel = c(0, 3, 5, 10, 30),
		     Hugo = c(2, 2, 6, 9, 9),
		     Year = seq(2014, 2022, 2))
LabSize.Long = pivot_longer(LabSize,
			    cols = !Year, # all columns from LabSize, except "Year"
			    names_to = "PI", 
			    values_to = "LabMembers")

ggplot(LabSize.Long, 
       aes(x = Year, y = LabMembers, color = PI)) +
	# specify the width of the line
	geom_line(linewidth = 1.2) +
	# specify the colors manually
	scale_color_manual(values = c("green", "red")) + 
	# Change the size of the title of the y axis
	theme(axis.title.y = element_text(size = 20))

# Save the plot with ggsave 
# you can add height and width to change the figure size
ggsave("Plots/LabSize_linechart.jpeg")
