### Data Partition ###

## Loading packages

library(caret)


## data partition

set.seed(1234)
intrain <- createDataPartition(db$NU_NOTA_MT, p = 0.98, list = FALSE)

dim(intrain)

## Separating small sample

teste <- db[-intrain, ]
dim(teste)


## Write a new file

write.csv(teste,'db_partition.csv')
