

raw_data = googlesheets4::read_sheet("https://docs.google.com/spreadsheets/d/1BNrSySkNrXxG5AqWAdF6ht19JtbCrXnF4reFQy8T508/edit?gid=2016972168#gid=2016972168")


datos_genero_becas <- raw_data %>%
  group_by(resultado, convocatoria, escalafon, sexo, disciplina_codigo) %>%
  summarise(n = n())

write.csv(datos_genero_becas, "data/datos_genero_becas.csv", row.names = F)


datos_cic <- googlesheets4::read_sheet("https://docs.google.com/spreadsheets/d/1q0EgDt609trVpPxQ8p7tP2q6jZRc4lxXD2ykmNUI2K4/edit?gid=1178193195#gid=1178193195")



datos_genero_cic <- datos_cic %>%
  group_by(resultado, convocatoria, sexo, disciplina_codigo) %>%
  summarise(n = n())

write.csv(datos_genero_cic, "data/datos_genero_cic.csv", row.names = F)




