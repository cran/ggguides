## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 6,
  fig.height = 4
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

## ----style-size, fig.show='hold', out.width='48%'-----------------------------
p <- ggplot(mtcars, aes(mpg, wt, color = factor(cyl))) +
  geom_point(size = 3) +
  labs(color = "Cylinders")

p + ggtitle("Default size")
p + legend_style(size = 14) + ggtitle("size = 14")

## ----style-family, fig.show='hold', out.width='48%'---------------------------
p + legend_style(family = "serif") + ggtitle("serif")
p + legend_style(family = "mono") + ggtitle("mono")

## ----style-title--------------------------------------------------------------
p + legend_style(
  size = 12,
  title_size = 14,
  title_face = "bold"
)

## ----rotation-basic, fig.width=7----------------------------------------------
p_long <- ggplot(mpg, aes(displ, hwy, color = class)) +
  geom_point()

p_long + legend_style(angle = 45)

## ----rotation-vertical, fig.width=7-------------------------------------------
p_long + legend_style(angle = 90)

## ----rotation-title, fig.show='hold', out.width='48%'-------------------------
p_long + legend_style(title_angle = 90, title_hjust = 0.5) + ggtitle("Rotated title only")
p_long + legend_style(angle = 45, title_angle = 90) + ggtitle("Both rotated")

## ----style-background---------------------------------------------------------
p + legend_style(
  background = "#FFF3E0"
)

## ----style-border-------------------------------------------------------------
p + legend_style(
  background = "#FFF3E0",
  background_color = "#FF9800"
)

## ----style-key----------------------------------------------------------------
p + legend_style(
  key_width = 1.5,
  key_height = 1.5
)

## ----style-margin-------------------------------------------------------------
p + legend_style(
  background = "#FFF3E0",
  margin = 0.5
)

## ----style-full---------------------------------------------------------------
p + legend_style(
  size = 11,
  title_size = 13,
  title_face = "bold",
  family = "sans",
  key_width = 1.2,
  background = "#FFF3E0",
  background_color = "#FF9800",
  margin = 0.3
)

## ----wrap-ncol, fig.width=7---------------------------------------------------
ggplot(mpg, aes(displ, hwy, color = class)) +
  geom_point() +
  legend_wrap(ncol = 2)

## ----wrap-nrow, fig.width=7---------------------------------------------------
ggplot(mpg, aes(displ, hwy, color = class)) +
  geom_point() +
  legend_wrap(nrow = 2)

## ----wrap-bottom, fig.width=7-------------------------------------------------
ggplot(mpg, aes(displ, hwy, color = class)) +
  geom_point() +
  legend_wrap(nrow = 2) +
  legend_bottom()

## ----keys-size, fig.show='hold', out.width='48%'------------------------------
p_small <- ggplot(mtcars, aes(mpg, wt, color = factor(cyl))) +
  geom_point(size = 1) +
  labs(color = "Cylinders")

p_small + ggtitle("Small points in legend")
p_small + legend_keys(size = 4) + ggtitle("Enlarged legend keys")

## ----keys-alpha, fig.show='hold', out.width='48%'-----------------------------
p_alpha <- ggplot(mtcars, aes(mpg, wt, color = factor(cyl))) +
  geom_point(alpha = 0.3, size = 3) +
  labs(color = "Cylinders")

p_alpha + ggtitle("Transparent legend keys")
p_alpha + legend_keys(alpha = 1) + ggtitle("Opaque legend keys")

## ----keys-combined------------------------------------------------------------
ggplot(mtcars, aes(mpg, wt, color = factor(cyl))) +
  geom_point(alpha = 0.3, size = 1) +
  legend_keys(size = 4, alpha = 1)

## ----keys-fill----------------------------------------------------------------
ggplot(mtcars, aes(factor(cyl), mpg, fill = factor(cyl))) +
  geom_boxplot(alpha = 0.5) +
  legend_keys(alpha = 1, aesthetic = "fill")

## ----keys-shape, fig.show='hold', out.width='48%'-----------------------------
p + legend_keys(shape = "square") + ggtitle("Square")
p + legend_keys(shape = "diamond") + ggtitle("Diamond")

## ----keys-outline, fig.show='hold', out.width='48%'---------------------------
# White fill with colored outline - works with color mapping only
p + legend_keys(shape = "circle_filled", fill = "white", stroke = 1.5) +
  ggtitle("White fill, colored outline")

# Colored fill with black outline - requires mapping BOTH color and fill
ggplot(mtcars, aes(mpg, wt, color = factor(cyl), fill = factor(cyl))) +
  geom_point(size = 3, shape = 21, stroke = 1) +
  legend_keys(colour = "black", stroke = 1) +
  ggtitle("Colored fill, black outline")

## ----order-explicit-----------------------------------------------------------
p + legend_order(c("8", "6", "4"))

## ----order-rev, fig.show='hold', out.width='48%'------------------------------
p + legend_order(rev) + ggtitle("Reversed")
p + legend_order(sort) + ggtitle("Sorted")

## ----order-fill---------------------------------------------------------------
ggplot(mtcars, aes(factor(cyl), fill = factor(cyl))) +
  geom_bar() +
  legend_order(c("8", "4", "6"), aesthetic = "fill")

## ----reverse------------------------------------------------------------------
p + legend_reverse()

## ----combined-styling, fig.width=7--------------------------------------------
ggplot(mpg, aes(displ, hwy, color = class)) +
  geom_point() +
  legend_left() +
  legend_style(
    size = 11,
    title_face = "bold",
    background = "#FFF3E0"
  )

## ----combined-wrap-style, fig.width=7-----------------------------------------
ggplot(mpg, aes(displ, hwy, color = class)) +
  geom_point() +
  legend_wrap(ncol = 2) +
  legend_bottom() +
  legend_style(size = 10, title_face = "bold")

## ----colorbar-basic-----------------------------------------------------------
p_cont <- ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
  geom_tile()

p_cont

## ----colorbar-size------------------------------------------------------------
p_cont + colorbar_style(width = 0.5, height = 10, aesthetic = "fill")

## ----colorbar-horizontal------------------------------------------------------
p_cont + colorbar_style(width = 10, height = 0.5, direction = "horizontal", aesthetic = "fill") +
  legend_bottom()

## ----colorbar-frame, fig.show='hold', out.width='48%'-------------------------
p_cont + colorbar_style(frame = TRUE, aesthetic = "fill") + ggtitle("Black frame")
p_cont + colorbar_style(frame = "#FF9800", aesthetic = "fill") + ggtitle("Orange frame")

## ----colorbar-noticks---------------------------------------------------------
p_cont + colorbar_style(ticks = FALSE, frame = "#FF9800", aesthetic = "fill")

## ----colorbar-full------------------------------------------------------------
p_cont + colorbar_style(
  width = 0.5,
  height = 8,
  frame = "#E65100",
  ticks_length = 0.3,
  aesthetic = "fill"
)

