# USAboundaries 0.3.0

- Moved most data to USAboundariesData. This improves loading time and permits more frequent updates to the user-facing package.
- Added state plane projections table and functions (@jfbratt). Now users can get an appropriate projection for a state.
- Converted all boundary objects to `sf` objects.
- Updated all contemporary census boundaries from the 2014 to the 2016 versions.
- Added zipcode tabulation area centroids.
- Added historical city populations compiled by Erik Steiner at CESTA/Stanford University.

# USAboundaries 0.2.0

-  Added contemporary boundaries for states, counties, and congressional districts.
-  Import many fewer packages. The `us_boundaries()` function no longer has an option to return a fortified data frame. It is assumed that users will convert the `SpatialPolygonsDataFrame` objects to whatever format they need.
-  High resolution data is now available in the USAboundariesData package.

# USAboundaries 0.1.1

-  Fix to README.md as requested by CRAN.

# USAboundaries 0.1

-   Initial release.
-   `us_boundaries()` returns an sp object or a data frame which can be
    plotted.
