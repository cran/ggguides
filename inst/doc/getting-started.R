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

## ----eval=FALSE---------------------------------------------------------------
# install.packages("ggguides")

## ----eval=FALSE---------------------------------------------------------------
# # install.packages("pak")
# pak::pak("gcol33/ggguides")

## ----base-plot----------------------------------------------------------------
p <- ggplot(mtcars, aes(mpg, wt, color = factor(cyl))) +
  geom_point(size = 3) +
  labs(color = "Cylinders")

p

## ----position-left------------------------------------------------------------
p + legend_left()

## ----position-bottom----------------------------------------------------------
p + legend_bottom()

## ----inside-topright----------------------------------------------------------
p + legend_inside(position = "topright")

## ----inside-coords------------------------------------------------------------
p + legend_inside(x = 0.02, y = 0.98, justification = c("left", "top"))

## ----legend-none--------------------------------------------------------------
p + legend_none()

## ----style-size---------------------------------------------------------------
p + legend_style(size = 14)

## ----style-full---------------------------------------------------------------
p + legend_style(
  size = 12,
  title_size = 14,
  title_face = "bold",
  background = "#FFF3E0",
  background_color = "#FF9800"
)

## ----wrap-example-------------------------------------------------------------
ggplot(mpg, aes(displ, hwy, color = class)) +
  geom_point() +
  legend_wrap(ncol = 2)

## ----combined-----------------------------------------------------------------
ggplot(mpg, aes(displ, hwy, color = class)) +
  geom_point() +
  legend_left() +
  legend_style(size = 12, title_face = "bold", background = "#FFF3E0")

## ----combined-wrap------------------------------------------------------------
ggplot(mpg, aes(displ, hwy, color = class)) +
  geom_point() +
  legend_wrap(ncol = 2) +
  legend_bottom()

