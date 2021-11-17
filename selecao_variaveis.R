### Loading packages

library(data.table)
library(tidyverse)


### loading data

db <- file.choose()

db <- fread(db, dec = ";")


### select variables

db1 <- db1 %>% 
  select(NU_ANO, NU_IDADE, TP_SEXO, TP_COR_RACA,SG_UF_NASCIMENTO, TP_ST_CONCLUSAO,
         TP_ESCOLA, TP_ENSINO, TP_PRESENCA_MT, NU_NOTA_CN, NU_NOTA_CH, NU_NOTA_LC,
         NU_NOTA_MT, NU_NOTA_REDACAO, Q001, Q002, Q003, Q004, Q005, Q006, Q007, Q008, Q009, Q010, Q011, Q012, Q013, 
         Q014, Q015, Q016, Q017, Q018, Q019, Q020, Q021, Q022, Q023, Q024, Q025) %>% 
  filter(TP_PRESENCA_MT == 1) %>% # students present in the math test
  na.omit() # remove NA

db1 <- db1[, -1]




View(db1[1:5,])
View(db[1:5,])

