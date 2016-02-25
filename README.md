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

## Useful Information about the Data

*All information below assumes the data is in the csv format generated above*

### Data Formats

All of the data is numerical, with a number corresponding to a data point or a
categorical answer that can be found under the variable in the code book. Nine's
are used as a `null` type in the dataset so if a column is entirely or mostly 9s
there's a good chance it's not meaningful - however, consult the codebook on what
the variable represents.

First row is the headers. The row id is listed as `""`, the serial number is the
next column, represented by `"v0001"`. All other variables are listed in this
format `"vXXXX"`, which corresponds to the description in the codebook. An example
of the first 5 headers are below:

```
"","v0001","v0002","v0003","v0004"
```

The data in the following rows corresponds to the column headers in the first row.
For example the first 5 columns of the first 5 rows:
```
"","v0001","v0002","v0003","v0004"
"1",15717,10,201,2
"2",15718,10,201,2
"3",15719,10,201,2
"4",15720,10,201,2
```

### Useful Commands

First n lines of file (use 1 for just the headers)
```
$ head -n 5 data.csv
```

All of one column. Replace `$1` with column number:
```
$ awk 'BEGIN{RS="\n"; FS=","}{print $1}' data.csv
```

If you have the variable number add one and remove the v:
```
# v0001 --> $2 or $0002
$ awk 'BEGIN{RS="\n"; FS=","}{print $2}' data.csv
```

If you want multiple columns, simply add them to the print:
```
$ awk 'BEGIN{RS="\n"; FS=","}{print $1, $2, $3}' data.csv
```

Pipe column(s) to file:
```
$ awk 'BEGIN{RS="\n"; FS=","}{print $1, $2}' data.csv > columns.txt
```

Search column(s):
```
# only prints row when serial number begins in 180
$ awk 'BEGIN{RS="\n"; FS=","}{print $1, $2}' data.csv | grep "\s180"
```

Pipe search to file:
```
$ awk 'BEGIN{RS="\n"; FS=","}{print $1, $2}' data.csv | grep "\s180" > search.txt
```

Search first 5 columns of first 5 rows for 15719:
```
$ head -n 5 data.csv | awk 'BEGIN{RS="\n"; FS=","}{print $1, $2, $3, $4, $5}' | grep "15719"
```

Most operations we might want to do can probably be composed from the above
commands. They're super helpful for checking one item when reading the codebook.
