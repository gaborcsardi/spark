


[![Linux Build Status](https://travis-ci.org/gaborcsardi/spark.svg?branch=master)](https://travis-ci.org/gaborcsardi/spark)
[![Windows Build status](https://ci.appveyor.com/api/projects/status/github/gaborcsardi/spark?svg=true)](https://ci.appveyor.com/project/gaborcsardi/spark)
[![CRAN RStudio mirror downloads](http://cranlogs.r-pkg.org/badges/spark)](http://cran.r-project.org/web/packages/spark/index.html)
[![Coverage Status](https://img.shields.io/codecov/c/github/gaborcsardi/spark/master.svg)](https://codecov.io/github/gaborcsardi/spark?branch=master)

# spark

This is an R port of [spark.sh](https://github.com/holman/spark).

The [spark.sh wiki](https://github.com/holman/spark/wiki/Wicked-Cool-Usage)
has some cool usage examples.

## Installation

Install it from github, with the `devtools` package:


```r
devtools::install_github("gaborcsardi/spark")
```


```r
library(spark)
```

## Enhancements

The R package has some improvements compared to the original shell implementation.

### Scaling

The length of the spark line can be fitted to the width of the teminal window:


```r
spark(lynx, width = "auto")
```

```
##> ▁▁▂▄▆▇▃▁▁▁▄▄▂▁▁▁▁▃▃▁▁▁▂▄▃▁▁▁▂▆▆▁▁▁▂▃▂▁▁▁▂▄▅▂▁▁▁▁▃▅▁▁▁▂▇█▄▁▁▂▅▅▅▂▁▁▁▂▄▄▂▁▂▃▄
```

### Matrices

Matrices can be plotted row-wise:


```r
spark(t(EuStockMarkets), width="auto", common_scale = FALSE)
```

```
##> ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▁▂▂▂▂▂▂▂▂▂▂▂▂▂▂▃▃▃▃▃▄▄▄▅▅▆▅▅▅▆▆▇▇███
##> ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▃▃▃▃▃▃▃▃▃▃▃▄▄▄▅▅▆▅▅▅▆▆▇█████
##> ▁▁▁▁▁▁▁▁▁▂▁▁▁▁▁▁▁▁▁▁▁▁▂▂▂▂▂▂▂▂▂▁▂▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▂▂▂▁▂▂▂▂▃▃▃▄▄▄▄▅▄▄▄▅▇▇███
##> ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▂▂▁▂▂▂▂▂▂▃▃▂▂▂▂▂▂▂▂▂▂▂▂▂▃▃▃▃▃▃▃▄▃▄▄▄▄▄▄▄▄▄▅▅▅▆▆▆▆▆▆▇▇█████
```

### Marking minima and maxima


```r
spark(lh, max = crayon::red)
```

```
##> ▄▄▄▄▃▁▄▄▅▃▂▂▄▂▇▇▅▄▄▂▂▂▅▇▄▃▃▆▆▅▅▄▅▄▂▂▁▁▃███▇▅▃█▇▆
```

