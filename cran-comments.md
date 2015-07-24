## Test environments
* local OS X install, R 3.1.2
* ubuntu 12.04 (on travis-ci), R 3.1.2
* Debian (via Docker), R-devel
* win-builder (devel and release)

## R CMD check results
There were no ERRORs or WARNINGs or NOTES.

## Accompanying 'USAboundariesData' package

This is an updated version of the 'USAboundaries' package from version 0.1.1 to version 0.2.0. It adds an improved interface and contemporary boundary data in addition to the historical data in the earlier version. In this version, all data has been moved to the 'USAboundariesData' package. Though that package is 48.8Mb and so over the limit prescribed in the documentation for writing R extensions, it will be updated infrequently.
