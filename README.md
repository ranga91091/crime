# Crime

Predicting what causes crime by analyzing data from past and current prisoners.

## Preprocessing Data

Download all of the data in `.xpt` format (may need to download all files and delete
extra ones) from [ICPSR](https://www.icpsr.umich.edu/icpsrweb/ICPSR/series/70)
and place into the `data/` directory. (pick one year, tested with 2004).

We can then use [R](https://cran.r-project.org/) to transform data from SPSS
formats to CSV which makes it easier to work with. Run the following commands in
a R console to load the proper packages and process the data.

Inside a R console:
```
install.packages('Hmisc')

library(foreign)
library(Hmisc)

xpt = sasxport.get("<absolute path to your data folder>/04572-0001-Data.xpt")
write.csv(xpt, file="<absolute path to your data folder>/data.csv")
```

This will generate a file called `data.csv` within the `data/` folder that we
can process to upload into a datastore.
