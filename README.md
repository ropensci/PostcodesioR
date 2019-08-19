PostcodesioR
================

[![Travis-CI Build
Status](https://travis-ci.org/ropensci/PostcodesioR.svg?branch=master)](https://travis-ci.org/ropensci/PostcodesioR)
[![Coverage
Status](https://img.shields.io/codecov/c/github/ropensci/PostcodesioR/master.svg)](https://codecov.io/github/ropensci/PostcodesioR?branch=master)
[![Package-License](http://img.shields.io/badge/license-GPL--3-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-3.0.html)
[![](http://badges.ropensci.org/176_status.svg)](https://github.com/ropensci/onboarding/issues/176)
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/PostcodesioR)](https://cran.r-project.org/package=PostcodesioR)

An API wrapper around [postcodes.io](https://postcodes.io/) - free UK
postcode lookup and geocoder. This package helps to find and transform
information about UK administrative geography like postcodes, LSOA,
MSOA, constituencies, counties, wards, districts, CCG or NUTS.

The package is based exclusively on open data provided by postcodes.io.
PostcodesioR can be used by data scientists or social scientists working
with geocoded UK data. A common task when working with such data is
aggregating geocoded data on different administrative levels,
e.g. turning postcode-level data into counties. This package can help
is achieving this and in many other cases.

## Installation

This package is a developmental version and is available only on GitHub.
Hopefully, it will eventually make it to CRAN. In order to install
PostcodesioR use the following commands:

``` r
if(!require("devtools")) {
  install.packages("devtools")
}
devtools::install_github("erzk/PostcodesioR")
```

## Loading

To start using the package use the standard command after you installed
it.

``` r
library(PostcodesioR)
```

## Examples

Where possible, I tried to return a data frame. Unfortunately, a lot of
API calls return more complex data and in those cases it is safer to use
lists. The API uses defaults to limit the number of returned calls.
Check functions’ documentation for more details.

For additional information about the returned data and the function
calls see the original [documentation](https://postcodes.io/docs).

The main function of this package provides information related to a
given postcode

``` r
lookup_result <- postcode_lookup("EC1Y8LX")

#overview
str(lookup_result)
```

    ## 'data.frame':    1 obs. of  31 variables:
    ##  $ postcode                       : chr "EC1Y 8LX"
    ##  $ quality                        : int 1
    ##  $ eastings                       : int 532544
    ##  $ northings                      : int 182128
    ##  $ country                        : chr "England"
    ##  $ nhs_ha                         : chr "London"
    ##  $ longitude                      : num -0.0909
    ##  $ latitude                       : num 51.5
    ##  $ european_electoral_region      : chr "London"
    ##  $ primary_care_trust             : chr "Islington"
    ##  $ region                         : chr "London"
    ##  $ lsoa                           : chr "Islington 023D"
    ##  $ msoa                           : chr "Islington 023"
    ##  $ incode                         : chr "8LX"
    ##  $ outcode                        : chr "EC1Y"
    ##  $ parliamentary_constituency     : chr "Islington South and Finsbury"
    ##  $ admin_district                 : chr "Islington"
    ##  $ parish                         : chr "Islington, unparished area"
    ##  $ admin_county                   : logi NA
    ##  $ admin_ward                     : chr "Bunhill"
    ##  $ ced                            : logi NA
    ##  $ ccg                            : chr "NHS Islington"
    ##  $ nuts                           : chr "Haringey and Islington"
    ##  $ admin_district_code            : chr "E09000019"
    ##  $ admin_county_code              : chr "E99999999"
    ##  $ admin_ward_code                : chr "E05000367"
    ##  $ parish_code                    : chr "E43000209"
    ##  $ parliamentary_constituency_code: chr "E14000764"
    ##  $ ccg_code                       : chr "E38000088"
    ##  $ ced_code                       : chr "E99999999"
    ##  $ nuts_code                      : chr "UKI43"

Check the
[vignette](https://docs.ropensci.org/PostcodesioR/articles/Introduction.html)
to see all functions in action.

## Notes

Currently, there is a limit to the number of API calls that can be made.
However, [postcodes.io](https://postcodes.io/) provides full list of
geolocation data that can be used locally without limitations. The
original data is sourced from [Office for National Statistics Data
Portal](https://geoportal.statistics.gov.uk/geoportal/catalog/main/home.page).
That
[file](https://github.com/ideal-postcodes/postcodes.io/blob/master/latest)
is rather large so I didn’t include it in the package.

Go to the package’s [website](https://docs.ropensci.org/PostcodesioR/)
or to my [blog](https://walczak.org/tag/postcodesior/) for more
examples.

## Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](https://github.com/ropensci/PostcodesioR/blob/master/CONDUCT.md).
By participating in this project you agree to abide by its
terms.

[![ropensci\_footer](https://ropensci.org/public_images/ropensci_footer.png)](https://ropensci.org)
