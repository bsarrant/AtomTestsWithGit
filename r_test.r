# r code functional with help of RBox (see https://atom.io/packages/rbox)

df <- iris
library(data.table)
dt <- as.data.table(df)
dt[Sepal.Length < 5]
