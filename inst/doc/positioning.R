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

## ----left-right, fig.show='hold', out.width='48%'-----------------------------
p <- ggplot(mtcars, aes(mpg, wt, color = factor(cyl))) +
  geom_point(size = 3) +
  labs(color = "Cylinders")

p + legend_left() + ggtitle("Left")
p + legend_right() + ggtitle("Right")

## ----top-bottom, fig.show='hold', out.width='48%'-----------------------------
p + legend_top() + ggtitle("Top")
p + legend_bottom() + ggtitle("Bottom")

## ----align-to, fig.show='hold', out.width='48%'-------------------------------
p_labeled <- p + labs(title = "Fuel Economy", y = "Weight (1000 lbs)")

# Default: align to panel (legend aligns with the plot area)
p_labeled + legend_top() + ggtitle("Panel alignment (default)")

# Align to full plot (legend spans title/axis labels too)
p_labeled + legend_top(align_to = "plot") + ggtitle("Plot alignment")

## ----inside-shortcuts, fig.show='hold', out.width='48%'-----------------------
p + legend_inside(position = "topright") + ggtitle("Top right")
p + legend_inside(position = "bottomleft") + ggtitle("Bottom left")

## ----inside-coords------------------------------------------------------------
p + legend_inside(x = 0.95, y = 0.95, justification = c("right", "top"))

## ----inside-background--------------------------------------------------------
p + legend_inside(
  position = "topright",
  background = "#FFF3E0",
  border = "#FF9800"
)

## ----direction, fig.show='hold', out.width='48%'------------------------------
p + legend_horizontal() + ggtitle("Horizontal")
p + legend_vertical() + ggtitle("Vertical")

## ----direction-position-------------------------------------------------------
p + legend_right() + legend_horizontal()

## ----legend-none--------------------------------------------------------------
p + legend_none()

