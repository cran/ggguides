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

## ----four-sides, fig.width = 8, fig.height = 6--------------------------------
p4 <- ggplot(mtcars, aes(mpg, wt,
                         colour = factor(cyl),
                         fill   = factor(gear),
                         size   = hp,
                         shape  = factor(am))) +
  geom_point(stroke = 1.2) +
  labs(colour = "Cyl", fill = "Gear", size = "HP", shape = "AM")

p4 +
  # 1. Send each legend to its side
  legend_top   (by = "colour") +
  legend_bottom(by = "fill")   +
  legend_left  (by = "size")   +
  legend_right (by = "shape")  +

  # 2. Slide each legend along its side
  legend_style(by = "colour", justification = "left") +
  legend_style(by = "fill",   justification = "right") +
  legend_style(by = "size",   justification = "top") +
  legend_style(by = "shape",  justification = "bottom") +

  # 3. Nudge each legend toward/away from the panel via margin (cm)
  legend_style(by = "colour", margin = c(0, 0, 0.3, 0)) +
  legend_style(by = "fill",   margin = c(0.3, 0, 0, 0)) +
  legend_style(by = "size",   margin = c(0, 0.3, 0, 0)) +
  legend_style(by = "shape",  margin = c(0, 0, 0, 0.3))

## ----six-legends, fig.width = 9, fig.height = 6.5-----------------------------
p6 <- ggplot(mtcars, aes(mpg, wt)) +
  geom_smooth(aes(linetype = factor(vs)), method = "lm", se = FALSE,
              colour = "grey40") +
  geom_point(aes(colour = factor(cyl),
                 fill   = factor(gear),
                 size   = hp,
                 alpha  = qsec,
                 shape  = factor(am)),
             stroke = 1.2) +
  scale_shape_manual(values = c(21, 24)) +
  labs(colour = "Cyl", fill = "Gear", size = "HP",
       alpha = "QSec", shape = "AM", linetype = "VS")

p6 +
  # 1. Side placement — two legends share the top, two share the right
  legend_top   (by = "colour")   +
  legend_top   (by = "fill")     +
  legend_right (by = "size")     +
  legend_right (by = "alpha")    +
  legend_bottom(by = "shape")    +
  legend_left  (by = "linetype") +

  # 2. Slide each legend along its rail
  #    top/bottom rails: "left" / "center" / "right" (or a number in [0,1])
  #    left/right rails: "top"  / "center" / "bottom"
  legend_style(by = "colour",   justification = "left")   +
  legend_style(by = "fill",     justification = "right")  +
  legend_style(by = "size",     justification = "top")    +
  legend_style(by = "alpha",    justification = "bottom") +
  legend_style(by = "shape",    justification = "center") +
  legend_style(by = "linetype", justification = "center") +

  # 3. Appearance — per-legend title weight, key size, direction, text size
  legend_style(by = "colour",   title_face = "bold",
               key_width = 0.4, key_height = 0.4) +
  legend_style(by = "fill",     title_face = "bold",
               key_width = 0.4, key_height = 0.4) +
  legend_style(by = "size",     title_size = 9, size = 8)  +
  legend_style(by = "alpha",    title_size = 9, size = 8)  +
  legend_style(by = "shape",    direction = "horizontal")  +
  legend_style(by = "linetype", direction = "vertical")    +

  # 4. Nudge each legend toward/away from the panel via margin (cm)
  #    order is c(top, right, bottom, left)
  legend_style(by = "colour",   margin = c(0, 0, 0.2, 0)) +
  legend_style(by = "fill",     margin = c(0, 0, 0.2, 0)) +
  legend_style(by = "size",     margin = c(0, 0, 0, 0.3)) +
  legend_style(by = "alpha",    margin = c(0, 0, 0, 0.3)) +
  legend_style(by = "shape",    margin = c(0.3, 0, 0, 0)) +
  legend_style(by = "linetype", margin = c(0, 0.3, 0, 0))

