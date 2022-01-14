### analise correspondencia  ###

### Carregando pacotes

library(data.table)
library(tidyverse)

### Carregando dados

db1 <- file.choose()

db1 <- fread(db1, dec = ";")


### Separando variaveis em blocos


# bloco 1: Dados do Participante

bloco1 <- db1 %>% 
  select(NU_IDADE, TP_SEXO, TP_COR_RACA, SG_UF_NASCIMENTO, 
         TP_ST_CONCLUSAO, TP_ESCOLA, TP_ENSINO, nota_matematica)

# bloco 2: Dados da Prova Objetiva 

bloco2 <- db1 %>% 
  select(nota_matematica, nota_natureza, nota_humanas, nota_linguagem, nota_redacao)

# Bloco 3: Dados do questionário Socioeconômico

bloco3 <- db1 %>% 
  select(Q001, Q002, Q003, Q004, Q005, Q006, Q007, Q008, Q009, Q010, Q011, Q012, 
         Q013, Q014, Q015, Q016, Q017, Q018, Q019, Q020, Q021, Q022, Q023, Q024,
         Q025, nota_matematica, nota_natureza, nota_humanas, nota_linguagem, nota_redacao)



#### analise de correspondencia ###


library(FactoMineR)
library(factoextra)

gc() # limpando memoria
memory.limit(9999999999)



res_mca1 <- MCA(bloco1)
res_mca2 <- MCA(bloco2)
res_mca3 <- MCA(bloco3)

