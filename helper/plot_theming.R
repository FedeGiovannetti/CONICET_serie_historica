color_principal <- "#E5989B"

theme_litera_minimal <- function(base_size = 15, base_family = "sans") {
  
    # 3. Actualizar defaults de los geoms más usados
  update_geom_defaults("point", list(colour = color_principal, size = 2))
  update_geom_defaults("line",  list(colour = color_principal, linewidth = 1))
  update_geom_defaults("col",   list(fill   = color_principal))
  update_geom_defaults("area",  list(fill   = color_principal, alpha = 0.8))
  
  theme_minimal(base_size = base_size, base_family = base_family) +
    theme(
      plot.title = element_text(face = "bold", size = base_size, hjust = 0.5),
      plot.subtitle = element_text(size = base_size * 1.1, hjust = 0.5, color = "gray40"),
      plot.caption = element_text(size = base_size * 0.8, color = "gray50", hjust = 1),
      axis.title = element_text(face = "bold", size = base_size*0.9, color = "gray30"),
      axis.text = element_text(color = "gray40"),
      panel.grid.major = element_line(color = "gray90"),
      panel.grid.minor = element_blank(),
      panel.background = element_rect(fill = "white", color = NA),
      plot.background = element_rect(fill = "white", color = NA),
      legend.position = "bottom",
      legend.title = element_blank(),
      legend.text = element_text(size = base_size * 0.8, color = "gray30")
    )
}


scale_color_pastel <- function(start = 1, ...) {
  colores <- c(
    "#A8DADC", "#F4A261", "#E5989B", "#B5E48C",
    "#9D5EDD", "#FFD6A5", "#8ECAE6", "#FFB5E8",
    "#C9CBA3", "#B9FBC0", "#D0BDF4", "#FDCB9E"
  )
  
  scale_color_manual(
    values = colores[start:length(colores)],
    ...
  )
}


scale_fill_pastel <- function(start = 1, ...) {
  colores <- c(
    "#A8DADC", "#F4A261", "#E5989B", "#B5E48C",
    "#9D5EDD", "#FFD6A5", "#8ECAE6", "#FFB5E8",
    "#C9CBA3", "#B9FBC0", "#D0BDF4", "#FDCB9E"
  )
  
  scale_fill_manual(
    values = colores[start:length(colores)],
    ...
  )
}

