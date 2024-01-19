##### About figures

# As discussed in the lab meeting, graphs should be at 1200 dpi and either 8 or 17 cm wide. 
# We can create functions that set these as default!
# With this, we can now use these functions to save our plots, instead of using ggsave.

# The function below is simply ggsave with 2 differences

my_ggsave <- function(plot = last_plot(),
		      dpi = 1200, 
		      columns = NA, ## NEED TO SET
		      device = NULL, 
		      path = NULL, 
		      scale = 1,  
		      height = NA, 
		      units = c("in", "cm", "mm", "px"),
		      limitsize = TRUE, 
		      bg = NULL) {
	# by setting dpi = 1200, we specify that, if not changed, dpi will be 1200
	# columns will be either 1 or 2. So if we want a figure to take one column, the width will be 8; if the figure takes 2 columns, the width will be 17
	if (!is.numeric(columns)) {
		stop("'columns' must be numeric!")
	} 
	width = ifelse(columns == 1, 8, 17)
	ggsave(plot = plot, 
	       filename = filename,
	       width = width,
	       dpi = dpi
	)
}