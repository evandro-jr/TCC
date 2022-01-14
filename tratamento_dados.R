
### Loading packages

library(data.table)
library(tidyverse)

### carregando dados

db1 <- file.choose()

db1 <- fread(db1, dec = ";")


### selecionando variaveis

db1 <- db1 %>% 
  select(NU_ANO, NU_IDADE, TP_SEXO, TP_COR_RACA,SG_UF_NASCIMENTO, TP_ST_CONCLUSAO,
         TP_ESCOLA, TP_ENSINO, TP_PRESENCA_MT, NU_NOTA_CN, NU_NOTA_CH, NU_NOTA_LC,
         NU_NOTA_MT, NU_NOTA_REDACAO, Q001, Q002, Q003, Q004, Q005, Q006, Q007, Q008, Q009, Q010, Q011, Q012, Q013, 
         Q014, Q015, Q016, Q017, Q018, Q019, Q020, Q021, Q022, Q023, Q024, Q025) %>% 
  filter(TP_PRESENCA_MT == 1) %>% # students present in the math test
  na.omit() # remove NA

db1 <- db1[, -1]


#### transformando variaveis


## Bloco 1 - Informacao do estudante 

db1$NU_ANO <- as.ordered(db1$NU_ANO)
db1$NU_IDADE <- as.ordered(db1$NU_IDADE)
db1$TP_SEXO <- as.factor(db1$TP_SEXO)
db1$TP_COR_RACA <- as.factor(db1$TP_COR_RACA)
db1$SG_UF_NASCIMENTO <- as.factor(db1$SG_UF_NASCIMENTO)
db1$TP_ST_CONCLUSAO <- as.factor(db1$TP_ST_CONCLUSAO)
db1$TP_ESCOLA <- as.factor(db1$TP_ESCOLA)
db1$TP_ENSINO <- as.factor(db1$TP_ENSINO)
db1$TP_PRESENCA_MT <- as.factor(db1$TP_PRESENCA_MT)

## Bloco 2 - Notas

db1$NU_NOTA_CN <- as.numeric(db1$NU_NOTA_CN)
db1$NU_NOTA_CH <- as.numeric(db1$NU_NOTA_CH)
db1$NU_NOTA_LC <- as.numeric(db1$NU_NOTA_LC)
db1$NU_NOTA_MT <- as.numeric(db1$NU_NOTA_MT)
db1$NU_NOTA_REDACAO <- as.numeric(db1$NU_NOTA_REDACAO)


## Bloco 3 - Questionario socio economico

db1$Q001 <- as.factor(db1$Q001)
db1$Q002 <- as.factor(db1$Q002)
db1$Q003 <- as.factor(db1$Q003)
db1$Q004 <- as.factor(db1$Q004)
db1$Q005 <- as.factor(db1$Q005)
db1$Q006 <- as.factor(db1$Q006)
db1$Q007 <- as.factor(db1$Q007)
db1$Q008 <- as.factor(db1$Q008)
db1$Q009 <- as.factor(db1$Q009)
db1$Q010 <- as.factor(db1$Q010)
db1$Q011 <- as.factor(db1$Q011)
db1$Q012 <- as.factor(db1$Q012)
db1$Q013 <- as.factor(db1$Q013)
db1$Q014 <- as.factor(db1$Q014)
db1$Q015 <- as.factor(db1$Q015)
db1$Q016 <- as.factor(db1$Q016)
db1$Q017 <- as.factor(db1$Q017)
db1$Q018 <- as.factor(db1$Q018)
db1$Q019 <- as.factor(db1$Q019)
db1$Q020 <- as.factor(db1$Q020)
db1$Q021 <- as.factor(db1$Q021)
db1$Q022 <- as.factor(db1$Q022)
db1$Q023 <- as.factor(db1$Q023)
db1$Q024 <- as.factor(db1$Q024)
db1$Q025 <- as.factor(db1$Q025)


### Separando notas em quintis


library(dvmisc)

nt_mat <- quant_groups(db1$NU_NOTA_MT, 5)
nt_cn <- quant_groups(db1$NU_NOTA_CN, 5)
nt_ch <- quant_groups(db1$NU_NOTA_CH, 5)
nt_lc <- quant_groups(db1$NU_NOTA_LC, 5)
nt_red <- quant_groups(db1$NU_NOTA_REDACAO, 5)

## adicionando a base de dados

db1 <- db1 %>%
  mutate(nota_matematica = nt_mat) %>%
  mutate(nota_natureza = nt_cn) %>%
  mutate(nota_humanas = nt_ch ) %>%
  mutate(nota_linguagem = nt_lc) %>%
  mutate(nota_redacao = nt_red)


## Exportando dados

write.csv(db1,'db_enem_2019.csv')


