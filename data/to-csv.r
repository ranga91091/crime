install.packages('Hmisc')

library(foreign)
library(hmisc)

xpt = sasxport.get("04572-0001-Data.xpt")
write.csv(xpt, file="data.csv")
