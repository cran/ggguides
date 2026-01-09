## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 7,
  fig.height = 5
)
library(ggguides)
library(ggplot2)

# Theme with transparent backgrounds for pkgdown light/dark mode
theme_set(
  theme_grey() +
    theme(
      plot.background = element_rect(fill = "transparent", color = NA),
      panel.background = element_rect(fill = "transparent", color = NA),
      legend.background = element_rect(fill = "transparent", color = NA),
      legend.key = element_rect(fill = "transparent", color = NA),
      legend.box.background = element_rect(fill = "transparent", color = NA)
    )
)

## ----example-plot-------------------------------------------------------------
# Plot with multiple aesthetics
p <- ggplot(mtcars, aes(mpg, wt,
                        color = factor(cyl),
                        size = hp,
                        shape = factor(am))) +
  geom_point() +
  labs(color = "Cylinders", size = "Horsepower", shape = "Transmission")

p

## ----hide-legends-------------------------------------------------------------
# Hide the size legend
p + legend_hide(size)

# Hide multiple legends
p + legend_hide(size, shape)

## ----select-legends-----------------------------------------------------------
# Keep only the colour legend
p + legend_select(colour)

# Keep colour and shape
p + legend_select(colour, shape)

## ----order-legends------------------------------------------------------------
# Default order
p

# Size legend first, then colour, then shape
p + legend_order_guides(size = 1, colour = 2, shape = 3)

## ----merge-legends------------------------------------------------------------
# Plot where colour and fill map to the same variable
p_merge <- ggplot(mtcars, aes(mpg, wt, color = factor(cyl), fill = factor(cyl))) +
  geom_point(shape = 21, size = 4, stroke = 1.5) +
  labs(color = "Cylinders", fill = "Cylinders")

# Legends merge automatically when titles and labels match
p_merge

# Explicitly request merge (reinforces default behavior)
p_merge + legend_merge(colour, fill)

## ----split-legends------------------------------------------------------------
# Force separate legends even when they could merge
p_merge + legend_split(colour, fill)

## ----position-separately------------------------------------------------------
# Place colour legend on the left, size legend at bottom
p +
  legend_hide(shape) +
  legend_left(by = "colour") +
  legend_bottom(by = "size")

## ----position-top-right-------------------------------------------------------
# Colour legend on top, size on right
p +
  legend_hide(shape) +
  legend_top(by = "colour") +
  legend_right(by = "size")

## ----style-separately---------------------------------------------------------
p +
  legend_hide(shape) +
  legend_style(title_face = "bold", background = "grey95", by = "colour") +
  legend_style(size = 10, by = "size")

## ----combined-----------------------------------------------------------------
# Complex example: hide shape, position colour on left with bold title,
# position size at bottom with smaller text
p +
  legend_hide(shape) +
  legend_left(by = "colour") +
  legend_style(title_face = "bold", title_size = 14, by = "colour") +
  legend_bottom(by = "size") +
  legend_style(size = 9, direction = "horizontal", by = "size")

