## USAboundaries: Historical boundaries of the United States, 1629-2000

[![Build Status](https://travis-ci.org/ropensci/USAboundaries.png?branch=master)](https://travis-ci.org/ropensci/USAboundaries)

This R package lets you map the United States of America (or the colonies that  became the United States) on any date from 1629 to 2000. It contains both county and state/territory level polygons.

### Installation

You can install this package from CRAN.

```
install.packages("USAboundaries")
```

Or you can install the development version from GitHub. First install [devtools](https://github.com/hadley/devtools). Then install this package from GitHub.

```
devtools::install_github("ropensci/USAboundaries")
```

### Use

The `us_boundaries()` function takes a date (either a character vector such as `"1856-03-14"` or any object coercable to a date with `as.Date()`) and returns a spatial object. That spatial object can then be plotted using the [sp](http://cran.r-project.org/web/packages/sp/index.html) package.

```
library(USAboundaries) 
map <- us_boundaries("1840-03-12")

if(require(sp)) {
  plot(map) 
}
```

### Citation and license

The historical data provided in this package is available under the CC BY-NC-SA 2.5 license from John H. Long, et al., [Atlas of Historical County Boundaries](http://publications.newberry.org/ahcbp/), Dr. William M. Scholl Center for American History and Culture, The Newberry Library, Chicago (2010). Please cite that project if you use this package in your research, but I would also appreciate a citation to the R package itself.

---
[![rOpenSci footer](http://ropensci.org/public_images/github_footer.png)](http://ropensci.org)
