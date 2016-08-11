# PostcodesioR
Wrapper around postcodes.io - a free Postcode lookup API and geocoder for the UK

Installation
------------

This package is still in a development version and is available only on GitHub. Not sure if it will ever make it to CRAN. In order to install it use the following commands:

``` r
# install.packages("devtools")
devtools::install_github("erzk/PostcodesioR")
```

Loading
-------

To start using the package use the standard command after you installed it.

``` r
library(PostcodesioR)
```

Examples
--------

For examples of usage go to my blog: <https://walczak.org/2016/07/postcode-and-geolocation-api-for-the-uk/>

Notes
-----

This package is a wrapper around [postcodes.io](http://postcodes.io/) which is a free Postcode lookup API and geocoder for the UK.

Currently there is a limit to the number of API calls. However, postcoes.io provide full list of geolocation data that can be used locally without limitations. Original data is sourced from [Office for National Statistics Data Porta](https://geoportal.statistics.gov.uk/geoportal/catalog/main/home.page). That [file](https://github.com/ideal-postcodes/postcodes.io/blob/master/latest) is rather large so I didn't include it with the package.

For more info see the original [documentation](https://postcodes.io/docs).
