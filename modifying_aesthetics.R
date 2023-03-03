# Packages ------------
library(tidyverse)



iris %>% 
  ggplot(aes(x = Sepal.Length, y = Sepal.Width,
             color = Species)) +
  geom_point()


iris %>% 
  ggplot(aes(x = Sepal.Length, y = Sepal.Width,
             color = Species)) +
  geom_point(alpha=0.5, position = "jitter")


posn_j <- position_jitter(.1, seed = 36)
iris %>% 
  ggplot(aes(x = Sepal.Length, y = Sepal.Width,
             color = Species)) +
  geom_point(position = posn_j)


iris %>% 
  ggplot(aes(x = Sepal.Length, y = Sepal.Width,
             color = Species)) +
  geom_point(position = posn_j) +
  scale_x_continuous("Sepal Length", limits = c(2,8)) +
  scale_color_discrete("Species")

# breaks control tick mark positions
iris %>% 
  ggplot(aes(x = Sepal.Length, y = Sepal.Width,
             color = Species)) +
  geom_point(position = posn_j) +
  scale_x_continuous("Sepal Length", limits = c(2,8),
                     breaks = seq(2, 8, 3)) +
  scale_color_discrete("Species")

# expand:expand the range of the scales  so that there is a small gap between the data 
# and the axes

iris %>% 
  ggplot(aes(x = Sepal.Length, y = Sepal.Width,
             color = Species)) +
  geom_point(position = posn_j) +
  scale_x_continuous("Sepal Length", limits = c(2,8),
                     breaks = seq(2, 8, 3),
                     expand = c(0,0)) +
  scale_color_discrete("Species")


# Exercises ------------

## Updating aesthetic labels -----------
# In this exercise, you'll modify some aesthetics to make a bar plot of the number 
# of cylinders for cars with different types of transmission.
# 
# You'll also make use of some functions for improving the appearance of the plot.
# 
# labs() to set the x- and y-axis labels. It takes strings for each argument.
# scale_fill_manual() defines properties of the color scale (i.e. axis). 
# The first argument sets the legend title. values is a named vector of colors to use.
# 1 Set the x-axis label to "Number of Cylinders", 
# and the y-axis label to "Count" using the x and y arguments of labs(), respectively.
mtcars2 <- mtcars %>% 
  mutate(fcyl = factor(cyl), 
         fam = ifelse(am == 0, "automatic", "manual"))

ggplot(mtcars2, aes(fcyl, fill = fam)) +
  geom_bar() +
  # Set the axis labels
  labs(x = "Number of Cylinders",
       y = "Count")


# Implement a custom fill color scale using scale_fill_manual(). 
# Set the first argument to "Transmission", and values to palette.
palette <- c(automatic = "#377EB8", manual = "#E41A1C")

ggplot(mtcars2, aes(fcyl, fill = fam)) +
  geom_bar() +
  labs(x = "Number of Cylinders", y = "Count") +
  # Set the fill color scale
  scale_fill_manual("Transmission", values = palette)


# Modify the code to set the position to dodge so that the bars 
# for transmissions are displayed side by side.
palette <- c(automatic = "#377EB8", manual = "#E41A1C")

# Set the position
ggplot(mtcars2, aes(fcyl, fill = fam)) +
  geom_bar(position = "dodge") +
  labs(x = "Number of Cylinders", y = "Count") +
scale_fill_manual("Transmission", values = palette)


## Setting a dummy aesthetic ---------
# In the last chapter you saw that all the visible aesthetics can serve 
# as attributes and aesthetics, but I very conveniently left out x and y. 
# That's because although you can make univariate plots (such as histograms, 
# which you'll get to in the next chapter), 
# a y-axis will always be provided, even if you didn't ask for it.

# You can make univariate plots in ggplot2, but you will need to add a fake y 
# axis by mapping y to zero.

# When using setting y-axis limits, you can specify the limits as 
# separate arguments, or as a single numeric vector. That is, ylim(lo, hi) or ylim(c(lo, hi)).

# 1
# Using mtcars, plot 0 vs. mpg.
# Make a scatter plot and add "jitter" to it.

# Plot 0 vs. mpg
ggplot(mtcars2, aes(x=mpg, y=0)) +
  # Add jitter 
  geom_point(position = "jitter")

#2. Use ylim() to set the limits on the y-axis from -2 to 2.
ggplot(mtcars, aes(mpg, 0)) +
  geom_jitter() +
  # Set the y-axis limits
  ylim(limit=c(-2,2))
