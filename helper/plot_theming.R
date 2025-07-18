

theme_litera_minimal <- function(base_size = 15, base_family = "sans") {
  theme_minimal(base_size = base_size, base_family = base_family) +
    theme(
      plot.title = element_text(face = "bold", size = base_size * 1.1, hjust = 0.5),
      plot.subtitle = element_text(size = base_size * 1.1, hjust = 0.5, color = "gray40"),
      plot.caption = element_text(size = base_size * 0.8, color = "gray50", hjust = 1),
      axis.title = element_text(face = "bold", size = base_size, color = "gray30"),
      axis.text = element_text(color = "gray40"),
      panel.grid.major = element_line(color = "gray90"),
      panel.grid.minor = element_blank(),
      panel.background = element_rect(fill = "white", color = NA),
      plot.background = element_rect(fill = "white", color = NA),
      legend.position = "bottom",
      legend.title = element_blank(),
      legend.text = element_text(size = base_size * 0.9, color = "gray30")
    )
}


scale_color_pastel <- function() {
  scale_color_manual(values = c(
    "#A8DADC", "#F4A261", "#E5989B", "#B5E48C",
    "#9D5EDD", "#FFD6A5", "#8ECAE6", "#FFB5E8",
    "#C9CBA3", "#B9FBC0", "#D0BDF4", "#FDCB9E"
  ))
}

scale_fill_pastel <- function() {
  scale_fill_manual(values = c(
    "#A8DADC", "#F4A261", "#E5989B", "#B5E48C",
    "#9D5EDD", "#FFD6A5", "#8ECAE6", "#FFB5E8",
    "#C9CBA3", "#B9FBC0", "#D0BDF4", "#FDCB9E"
  ))
}

