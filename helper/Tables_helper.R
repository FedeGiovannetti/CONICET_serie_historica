

custom_table <- function(data, escalafon){
  
  
    df = data %>% 
      filter(!is.na(Otorgadas)) %>%
      filter(Escalafon == escalafon) %>% 
      group_by(Modalidad, Convocatoria, Comisión) %>% 
      summarise(Otorgadas = sum(Otorgadas, na.rm = TRUE),
                Postulantes = sum(Postulantes, na.rm = TRUE)) %>%
      ungroup() %>%
      complete(Modalidad, Comisión, Convocatoria = 2015:2024) %>%
      mutate(
        Comisión = factor(Comisión, levels = c("KS1", "KS2", "KS3", "KS4", "KS5", "KS6",
                                               "KS7", "KS8", "KS9", "KS10")),
        colname = paste(Modalidad, Convocatoria, sep = "_")
      ) %>%
      pivot_wider(
        id_cols = Comisión,
        names_from = colname,
        values_from = Otorgadas
      ) %>%
      arrange(Comisión)
    
    # Reordenar columnas para que estén como TG_2015, TE_2015, TG_2016, TE_2016, ...
    modalidades <- c("Temas generales", "Temas estratégicos")
    anios <- 2015:2024
    orden_cols <- as.vector(outer(modalidades, anios, paste, sep = "_"))
    
    df <- df %>%
      select(Comisión, all_of(orden_cols))
    
    
    # Convocatoria <- 2015:2024
    # Crear header con años arriba y TG/TE abajo
    Convocatoria <- 2015:2024
    
    sketch <- withTags(
      table(
        class = 'display',
        thead(
          tr(
            th(rowspan = 2, "Comisión"),
            lapply(Convocatoria, function(a) 
              th(
                colspan = 2, 
                HTML(paste0('<div style="text-align:center"><br>', a, '</div>'))
              )
            )
          ),
          tr(
            lapply(rep(c("TG", "TE"), length(Convocatoria)), function(x) 
              th(HTML(paste0('<div style="text-align:center">', x, '</div>')))
            )
          )
        )
      )
    )
    
    
    css <- "
  table.dataTable {
    font-size: 12px !important;
  }
  "
  
  
  final_table = browsable(
    tagList(
      tags$style(HTML(css)),
      datatable(
        df,
        container = sketch,
        rownames = FALSE,
        extensions = c('FixedColumns', 'Buttons'),  # Add Buttons extension
        options = list(
          scrollY = "400px",
          scrollX = TRUE,
          fixedColumns = list(leftColumns = 1),
          scrollCollapse = TRUE,
          paging = TRUE,
          dom = 'Bftip',  # Add 'B' to show buttons
          buttons = list(
            list(extend = "csv", text = "Descargar datos")
          ),
          autoWidth = TRUE,
          columnDefs = list(
            list(className = 'dt-left', targets = 0),
            list(className = 'dt-center', targets = 1:(ncol(df)-1))
          )
        )
      )
    )
  )

  
    
return(final_table)
  
  
  
  
  
  
}
