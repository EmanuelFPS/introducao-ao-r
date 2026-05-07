if (!requireNamespace("pacman", quietly = TRUE)) {
  install.packages("pacman")
}
pacman::p_load(readxl, rio, tidyverse)

rm(demografico)
rm(laboratorio)
rm(saude_percebida)
rm(medidas_fisicas)
rm(habitos)

demografico <- read_excel('data/demografico.xlsx')
laboratorio <- read.csv('data/laboratorio.csv')
saude_percebida <- read.csv2('data/saude_percebida.csv')
medidas_fisicas <- read.table('data/medidas_fisicas.txt', header = TRUE, sep = ';')
habitos <- import('data/habitos.xlsx')

demografico$sexo <- demografico$sexo %>% toupper() %>% as.factor()
demografico$estado_civil <- demografico$estado_civil %>% toupper() %>% as.factor()
demografico$data_nascimento <- as.Date(demografico$data_nascimento, format = '%d/%m/%Y')
demografico <- demografico[-which(duplicated(demografico)),]
demografico <- demografico[-which(is.na(demografico$estado_civil)), ]
demografico$idade <- as.integer((as.Date("1997-01-01") - demografico$data_nascimento)/365)

habitos$tabagismo <- habitos$tabagismo %>% toupper() %>% as.factor()
habitos$consumo_alcool <- habitos$consumo_alcool %>% toupper() %>% as.factor()
habitos$atividade_fisica <- habitos$atividade_fisica %>% toupper() %>% as.factor()

laboratorio$sorologia_chagas <- laboratorio$sorologia_chagas %>% toupper() %>% as.factor()

saude_percebida$percepcao_saude <- saude_percebida$percepcao_saude %>% toupper() %>% as.factor()
saude_percebida$satisfacao_rede_social <- saude_percebida$satisfacao_rede_social %>% toupper() %>% as.factor()
saude_percebida$satisfacao_lazer <- saude_percebida$satisfacao_lazer %>% toupper() %>% as.factor()
saude_percebida$principal_problema <- saude_percebida$principal_problema %>% toupper() %>% as.factor()
saude_percebida$hipertensao <- saude_percebida$hipertensao %>% toupper() %>% as.factor()
saude_percebida$diabetes <- saude_percebida$diabetes %>% toupper() %>% as.factor()
saude_percebida$artrite <- saude_percebida$artrite %>% toupper() %>% as.factor()