---
title: "USAboundaries: Historical and Contemporary Boundaries of the United States of America"
tags: 
  - R
  - spatial
  - history
  - digital-history
authors:
  - name: Lincoln A. Mullen
    orcid: 0000-0001-5103-6917
    affiliation: 1
  - name: Jordan Bratt
    orcid: 0000-0001-9051-7203
    affiliation: 1
affiliations:
  - name: Department of History and Art History, George Mason University
    index: 1
date: 20 March 2018
bibliography: paper.bib
---

The USAboundaries package for R provides contemporary and historical boundaries of the United States of America [@USAboundaries]. (The package is available on [GitHub](https://github.com/ropensci/USAboundaries/) and archived on [Zenodo](https://doi.org/10.5281/zenodo.825218).) Historical data in the package includes state and county boundaries from 1629 to 2000 from the Newberry Library's "Atlas of Historical County Boundaries" [@ahcb]. Also included is historical city population data from Erik Steiner's "United States Historical City Populations, 1790-2010" [@steiner-cities]. Contemporary data in the package includes state, county, and Congressional district boundaries, as well as Zip Code Tabulation Area centroids. These data are all drawn from the U.S. Census Bureau [@census].

These historical and contemporary boundaries are provided at different resolutions suitable for national and state-level mapping. A consistent interface provides a way to easily select historical boundaries for any specific date. The package includes helper functions and datasets, including tables of state names, abbreviations and FIPS codes for joining to attribute data, as well as functions and data to get State Plane Coordinate System projections as EPSG codes or PROJ.4 strings [@stateplane]. A first step in many spatial analyses is joining data of interest to spatial data, which the datasets in this package enable.

This package underlies the [*Mapping Early American Elections*](http://earlyamericanelections.org/) project created by a team at the Roy Rosenzweig Center for History and New Media [@meae]. That project maps Congressional elections and state legislative elections from 1787 to 1825. The USAboundaries package provides access to the frequently changing state and county boundaries during that time period.  

*Development of this package was funded in part by a Humanities Collections and Reference Resources grant from the Division of Preservation and Access at the National Endowment for the Humanities (grant number PW-234776-16). The package is part of [rOpenSci](https://ropensci.org/).*

# References
