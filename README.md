## usboundaries: Historical boundaries of the United States, 1629--2000

This R package lets you map the United States (or the colonies that
became the United States) on any date from 1629 to 2000.

### Installation

First, install [devtools][]. Then install this package from GitHub.

    devtools::install_github("lmullen/usboundaries")

### Use

The `us_boundaries()` function takes a date object and returns a spatial
object. That spatial object can then be plotted using the [sp][]
package.

    library(usboundaries)
    map <- us_boundaries(as.Date("1840-03-12"))

    if(require(sp)) {
      plot(map)
    }

### Citation and license

The historical data provided in this package is available under the CC
BY-NC-SA 2.5 license from John H. Long, et al., [Atlas of Historical
County Boundaries][], Dr. William M. Scholl Center for American History
and Culture, The Newberry Library, Chicago (2010). Please cite that
project if you use this package in your research, but I would also
appreciate a citation to the R package itself.

  [devtools]: https://github.com/hadley/devtools
  [sp]: http://cran.r-project.org/web/packages/sp/index.html
  [Atlas of Historical County Boundaries]: http://publications.newberry.org/ahcbp/
