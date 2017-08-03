README
================
Eryk Walczak

[![Travis-CI Build Status](https://travis-ci.org/erzk/PostcodesioR.svg?branch=master)](https://travis-ci.org/erzk/PostcodesioR) [![Coverage Status](https://img.shields.io/codecov/c/github/erzk/PostcodesioR/master.svg)](https://codecov.io/github/erzk/PostcodesioR?branch=master) [![Package-License](http://img.shields.io/badge/license-GPL--3-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-3.0.html)

PostcodesioR
============

This package is an API wrapper around [postcodes.io](https://postcodes.io/) which is a free UK postcode lookup and geocoder.

Installation
------------

This package is still in a development version and is available only on GitHub. Not sure if it will ever make it to CRAN. In order to install it use the following commands:

``` r
if (!require("devtools")) install.packages("devtools")
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

### Lookup postcodes and outcodes

#### Single postcode

Provide a postcode to obtain all available information:

``` r
# load the package
library(PostcodesioR)

lookup_result <- postcode_lookup("EC1Y8LX")

#overview
str(lookup_result)
```

    ## List of 2
    ##  $ status: int 200
    ##  $ result:List of 23
    ##   ..$ postcode                  : chr "EC1Y 8LX"
    ##   ..$ quality                   : int 1
    ##   ..$ eastings                  : int 532544
    ##   ..$ northings                 : int 182128
    ##   ..$ country                   : chr "England"
    ##   ..$ nhs_ha                    : chr "London"
    ##   ..$ longitude                 : num -0.0909
    ##   ..$ latitude                  : num 51.5
    ##   ..$ parliamentary_constituency: chr "Islington South and Finsbury"
    ##   ..$ european_electoral_region : chr "London"
    ##   ..$ primary_care_trust        : chr "Islington"
    ##   ..$ region                    : chr "London"
    ##   ..$ lsoa                      : chr "Islington 023D"
    ##   ..$ msoa                      : chr "Islington 023"
    ##   ..$ incode                    : chr "8LX"
    ##   ..$ outcode                   : chr "EC1Y"
    ##   ..$ admin_district            : chr "Islington"
    ##   ..$ parish                    : chr "Islington, unparished area"
    ##   ..$ admin_county              : NULL
    ##   ..$ admin_ward                : chr "Bunhill"
    ##   ..$ ccg                       : chr "NHS Islington"
    ##   ..$ nuts                      : chr "Haringey and Islington"
    ##   ..$ codes                     :List of 6
    ##   .. ..$ admin_district: chr "E09000019"
    ##   .. ..$ admin_county  : chr "E99999999"
    ##   .. ..$ admin_ward    : chr "E05000367"
    ##   .. ..$ parish        : chr "E43000209"
    ##   .. ..$ ccg           : chr "E38000088"
    ##   .. ..$ nuts          : chr "UKI43"

#### Multiple postcodes

``` r
pc_list <- list(postcodes = c("PR3 0SG", "M45 6GN", "EX165BL"))
bulk_lookup_result <- bulk_postcode_lookup(pc_list)

#overview
str(bulk_lookup_result$result[1])
```

    ## List of 1
    ##  $ :List of 2
    ##   ..$ query : chr "PR3 0SG"
    ##   ..$ result:List of 23
    ##   .. ..$ postcode                  : chr "PR3 0SG"
    ##   .. ..$ quality                   : int 1
    ##   .. ..$ eastings                  : int 351012
    ##   .. ..$ northings                 : int 440302
    ##   .. ..$ country                   : chr "England"
    ##   .. ..$ nhs_ha                    : chr "North West"
    ##   .. ..$ longitude                 : num -2.75
    ##   .. ..$ latitude                  : num 53.9
    ##   .. ..$ parliamentary_constituency: chr "Wyre and Preston North"
    ##   .. ..$ european_electoral_region : chr "North West"
    ##   .. ..$ primary_care_trust        : chr "North Lancashire Teaching"
    ##   .. ..$ region                    : chr "North West"
    ##   .. ..$ lsoa                      : chr "Wyre 006A"
    ##   .. ..$ msoa                      : chr "Wyre 006"
    ##   .. ..$ incode                    : chr "0SG"
    ##   .. ..$ outcode                   : chr "PR3"
    ##   .. ..$ admin_district            : chr "Wyre"
    ##   .. ..$ parish                    : chr "Myerscough and Bilsborrow"
    ##   .. ..$ admin_county              : chr "Lancashire"
    ##   .. ..$ admin_ward                : chr "Brock with Catterall"
    ##   .. ..$ ccg                       : chr "NHS Morecambe Bay CCG"
    ##   .. ..$ nuts                      : chr "Lancaster and Wyre"
    ##   .. ..$ codes                     :List of 6
    ##   .. .. ..$ admin_district: chr "E07000128"
    ##   .. .. ..$ admin_county  : chr "E10000017"
    ##   .. .. ..$ admin_ward    : chr "E05009934"
    ##   .. .. ..$ parish        : chr "E04005340"
    ##   .. .. ..$ ccg           : chr "E38000216"
    ##   .. .. ..$ nuts          : chr "UKD44"

#### Outward code lookup

Provide an outcode to obtain geolocation data for the centroid of the specifid outcode:

``` r
ocl <- outward_code_lookup("E1")

#overview
str(ocl)
```

    ## List of 2
    ##  $ status: int 200
    ##  $ result:List of 10
    ##   ..$ outcode       : chr "E1"
    ##   ..$ longitude     : num -0.0593
    ##   ..$ latitude      : num 51.5
    ##   ..$ northings     : int 181624
    ##   ..$ eastings      : int 534750
    ##   ..$ admin_district:List of 3
    ##   .. ..$ : chr "City of London"
    ##   .. ..$ : chr "Hackney"
    ##   .. ..$ : chr "Tower Hamlets"
    ##   ..$ parish        :List of 3
    ##   .. ..$ : chr "Tower Hamlets, unparished area"
    ##   .. ..$ : chr "City of London, unparished area"
    ##   .. ..$ : chr "Hackney, unparished area"
    ##   ..$ admin_county  : list()
    ##   ..$ admin_ward    :List of 13
    ##   .. ..$ : chr "Bethnal Green"
    ##   .. ..$ : chr "Shadwell"
    ##   .. ..$ : chr "Portsoken"
    ##   .. ..$ : chr "Whitechapel"
    ##   .. ..$ : chr "Aldgate"
    ##   .. ..$ : chr "Tower"
    ##   .. ..$ : chr "Stepney Green"
    ##   .. ..$ : chr "Weavers"
    ##   .. ..$ : chr "Bishopsgate"
    ##   .. ..$ : chr "Hoxton East & Shoreditch"
    ##   .. ..$ : chr "Spitalfields & Banglatown"
    ##   .. ..$ : chr "St Peter's"
    ##   .. ..$ : chr "St Dunstan's"
    ##   ..$ country       :List of 1
    ##   .. ..$ : chr "England"

### Reverse geocoding

Provide latitude and longitude to obtain geographic information. Different levels of aggregation are available, i.e. postcode or outcode.

#### Single postcode

``` r
rev_geo <- reverse_geocoding(0.127, 51.507)

# overview
str(rev_geo$result[1])
```

    ## List of 1
    ##  $ :List of 24
    ##   ..$ postcode                  : chr "SE28 8NH"
    ##   ..$ quality                   : int 1
    ##   ..$ eastings                  : int 547715
    ##   ..$ northings                 : int 180780
    ##   ..$ country                   : chr "England"
    ##   ..$ nhs_ha                    : chr "London"
    ##   ..$ longitude                 : num 0.127
    ##   ..$ latitude                  : num 51.5
    ##   ..$ parliamentary_constituency: chr "Erith and Thamesmead"
    ##   ..$ european_electoral_region : chr "London"
    ##   ..$ primary_care_trust        : chr "Bexley"
    ##   ..$ region                    : chr "London"
    ##   ..$ lsoa                      : chr "Bexley 001D"
    ##   ..$ msoa                      : chr "Bexley 001"
    ##   ..$ incode                    : chr "8NH"
    ##   ..$ outcode                   : chr "SE28"
    ##   ..$ distance                  : num 38.9
    ##   ..$ admin_district            : chr "Bexley"
    ##   ..$ parish                    : chr "Bexley, unparished area"
    ##   ..$ admin_county              : NULL
    ##   ..$ admin_ward                : chr "Thamesmead East"
    ##   ..$ ccg                       : chr "NHS Bexley"
    ##   ..$ nuts                      : chr "Bexley and Greenwich"
    ##   ..$ codes                     :List of 6
    ##   .. ..$ admin_district: chr "E09000004"
    ##   .. ..$ admin_county  : chr "E99999999"
    ##   .. ..$ admin_ward    : chr "E05000084"
    ##   .. ..$ parish        : chr "E43000194"
    ##   .. ..$ ccg           : chr "E38000011"
    ##   .. ..$ nuts          : chr "UKI51"

#### Multiple postcodes

``` r
# create a JSON object with the coordinates
geolocations_list <- structure(
 list(
 geolocations = structure(
 list(
 longitude = c(-3.15807731271522, -1.12935802905177),
 latitude = c(51.4799900627036, 50.7186356978817),
 limit = c(NA, 100L),
 radius = c(NA, 500L)),
 .Names = c("longitude", "latitude", "limit", "radius"),
 class = "data.frame",
 row.names = 1:2)),
 .Names = "geolocations")

bulk_rev_geo <- bulk_reverse_geocoding(geolocations_list)

#overview
str(bulk_rev_geo$result)
```

#### Single outcode

``` r
out_rev_geocode <- outcode_reverse_geocoding("-3.15", "51.47")
# overview
str(out_rev_geocode$result[1])
```

    ## List of 1
    ##  $ :List of 11
    ##   ..$ outcode       : chr "CF99"
    ##   ..$ longitude     : num -3.16
    ##   ..$ latitude      : num 51.5
    ##   ..$ northings     : int 174588
    ##   ..$ eastings      : int 319421
    ##   ..$ admin_district:List of 1
    ##   .. ..$ : chr "Cardiff"
    ##   ..$ parish        :List of 1
    ##   .. ..$ : chr "Butetown"
    ##   ..$ admin_county  : list()
    ##   ..$ admin_ward    :List of 1
    ##   .. ..$ : chr "Butetown"
    ##   ..$ country       :List of 1
    ##   .. ..$ : chr "Wales"
    ##   ..$ distance      : num 997

### Generate random entries

#### Postcodes

Generates a data frame with a random UK postcode and corresponding geographic information:

``` r
# without restrictions
random_postcode()
```

    ##   postcode quality eastings northings country          nhs_ha longitude
    ## 1  SS7 2EJ       1   581803    186816 England East of England 0.6208185
    ##   latitude parliamentary_constituency european_electoral_region
    ## 1 51.55094               Castle Point                   Eastern
    ##   primary_care_trust          region              lsoa             msoa
    ## 1   South East Essex East of England Castle Point 006B Castle Point 006
    ##   incode outcode admin_district                        parish admin_county
    ## 1    2EJ     SS7   Castle Point Castle Point, unparished area        Essex
    ##   admin_ward                                     ccg                 nuts
    ## 1   St James NHS Castle Point, Rayleigh and Rochford Essex Thames Gateway
    ##   admin_district admin_county admin_ward    parish       ccg  nuts
    ## 1      E07000069    E10000012  E05004092 E43000061 E38000030 UKH37

A randomly generated postcode can also belong to a particular outcode:

``` r
# restrict to an outcode
random_postcode("N1")
```

    ##   postcode quality eastings northings country nhs_ha   longitude latitude
    ## 1   N1 7PP       1   532670    183081 England London -0.08874871 51.53106
    ##     parliamentary_constituency european_electoral_region
    ## 1 Hackney South and Shoreditch                    London
    ##          primary_care_trust region         lsoa        msoa incode outcode
    ## 1 City and Hackney Teaching London Hackney 026D Hackney 026    7PP      N1
    ##   admin_district                   parish admin_county  admin_ward
    ## 1        Hackney Hackney, unparished area           NA Hoxton West
    ##                    ccg               nuts admin_district admin_county
    ## 1 NHS City and Hackney Hackney and Newham      E09000012    E99999999
    ##   admin_ward    parish       ccg  nuts
    ## 1  E05009378 E43000202 E38000035 UKI41

#### Places

You can also generate a random place, specified by an OSGB code, with corresponding geographic information:

``` r
random_place()
```

    ##                   code    name_1 name_1_lang name_2 name_2_lang local_type
    ## 1 osgb4000000074570317 Driffield        NULL   NULL        NULL       Town
    ##   outcode           county_unitary county_unitary_type district_borough
    ## 1    YO25 East Riding of Yorkshire    UnitaryAuthority             NULL
    ##   district_borough_type                   region country longitude
    ## 1                  NULL Yorkshire and the Humber England -0.440094
    ##   latitude eastings northings min_eastings min_northings max_eastings
    ## 1 54.00568   502334    457754       501396        456485       503757
    ##   max_northings
    ## 1        458894

### Postcode validation

This function can validate a UK postcode:

``` r
postcode_validation("EC1Y 8LX") # actual UK postcode
```

    ## [1] TRUE

``` r
postcode_validation("XYZ") # incorrect UK postcode
```

    ## [1] FALSE

### Find nearest postcodes or outcodes

Provide a postcode to get a list of the nearest postcodes:

``` r
near_pc <- nearest_postcode("EC1Y 8LX")

#overview
str(near_pc$result[1])
```

    ## List of 1
    ##  $ :List of 24
    ##   ..$ postcode                  : chr "EC1Y 8LX"
    ##   ..$ quality                   : int 1
    ##   ..$ eastings                  : int 532544
    ##   ..$ northings                 : int 182128
    ##   ..$ country                   : chr "England"
    ##   ..$ nhs_ha                    : chr "London"
    ##   ..$ longitude                 : num -0.0909
    ##   ..$ latitude                  : num 51.5
    ##   ..$ parliamentary_constituency: chr "Islington South and Finsbury"
    ##   ..$ european_electoral_region : chr "London"
    ##   ..$ primary_care_trust        : chr "Islington"
    ##   ..$ region                    : chr "London"
    ##   ..$ lsoa                      : chr "Islington 023D"
    ##   ..$ msoa                      : chr "Islington 023"
    ##   ..$ incode                    : chr "8LX"
    ##   ..$ outcode                   : chr "EC1Y"
    ##   ..$ distance                  : int 0
    ##   ..$ admin_district            : chr "Islington"
    ##   ..$ parish                    : chr "Islington, unparished area"
    ##   ..$ admin_county              : NULL
    ##   ..$ admin_ward                : chr "Bunhill"
    ##   ..$ ccg                       : chr "NHS Islington"
    ##   ..$ nuts                      : chr "Haringey and Islington"
    ##   ..$ codes                     :List of 6
    ##   .. ..$ admin_district: chr "E09000019"
    ##   .. ..$ admin_county  : chr "E99999999"
    ##   .. ..$ admin_ward    : chr "E05000367"
    ##   .. ..$ parish        : chr "E43000209"
    ##   .. ..$ ccg           : chr "E38000088"
    ##   .. ..$ nuts          : chr "UKI43"

You can also use outcodes:

``` r
near_outcode <- nearest_outcode("EC1Y")
# overview
str(near_outcode$result[2])
```

    ## List of 1
    ##  $ :List of 11
    ##   ..$ outcode       : chr "EC2Y"
    ##   ..$ longitude     : num -0.0939
    ##   ..$ latitude      : num 51.5
    ##   ..$ northings     : int 181789
    ##   ..$ eastings      : int 532343
    ##   ..$ admin_district:List of 2
    ##   .. ..$ : chr "City of London"
    ##   .. ..$ : chr "Islington"
    ##   ..$ parish        :List of 2
    ##   .. ..$ : chr "City of London, unparished area"
    ##   .. ..$ : chr "Islington, unparished area"
    ##   ..$ admin_county  : list()
    ##   ..$ admin_ward    :List of 6
    ##   .. ..$ : chr "Bunhill"
    ##   .. ..$ : chr "Bassishaw"
    ##   .. ..$ : chr "Coleman Street"
    ##   .. ..$ : chr "Aldersgate"
    ##   .. ..$ : chr "Clerkenwell"
    ##   .. ..$ : chr "Cripplegate"
    ##   ..$ country       :List of 1
    ##   .. ..$ : chr "England"
    ##   ..$ distance      : num 398

### Find places

Provide a name of a place of interest. You can specify the number of results (default is 10):

``` r
place_query_result <- place_query("Hills", limit = 11)

# overview
str(place_query_result$result[1])
```

    ## List of 1
    ##  $ :List of 21
    ##   ..$ code                 : chr "osgb4000000074551849"
    ##   ..$ name_1               : chr "Hillside"
    ##   ..$ name_1_lang          : NULL
    ##   ..$ name_2               : NULL
    ##   ..$ name_2_lang          : NULL
    ##   ..$ local_type           : chr "Suburban Area"
    ##   ..$ outcode              : chr "G78"
    ##   ..$ county_unitary       : chr "East Renfrewshire"
    ##   ..$ county_unitary_type  : chr "UnitaryAuthority"
    ##   ..$ district_borough     : NULL
    ##   ..$ district_borough_type: NULL
    ##   ..$ region               : chr "Scotland"
    ##   ..$ country              : chr "Scotland"
    ##   ..$ longitude            : num -4.41
    ##   ..$ latitude             : num 55.8
    ##   ..$ eastings             : int 249096
    ##   ..$ northings            : int 659053
    ##   ..$ min_eastings         : int 248779
    ##   ..$ min_northings        : int 658683
    ##   ..$ max_eastings         : int 249466
    ##   ..$ max_northings        : int 659282

You can also find a place using an OSGB code:

``` r
place_lookup_result <- place_lookup("osgb4000000074544700")

# overview
str(place_lookup_result$result)
```

    ## List of 21
    ##  $ code                 : chr "osgb4000000074544700"
    ##  $ name_1               : chr "Cutler Heights"
    ##  $ name_1_lang          : NULL
    ##  $ name_2               : NULL
    ##  $ name_2_lang          : NULL
    ##  $ local_type           : chr "Suburban Area"
    ##  $ outcode              : chr "BD4"
    ##  $ county_unitary       : NULL
    ##  $ county_unitary_type  : NULL
    ##  $ district_borough     : chr "Bradford"
    ##  $ district_borough_type: chr "MetropolitanDistrict"
    ##  $ region               : chr "Yorkshire and the Humber"
    ##  $ country              : chr "England"
    ##  $ longitude            : num -1.72
    ##  $ latitude             : num 53.8
    ##  $ eastings             : int 418830
    ##  $ northings            : int 431785
    ##  $ min_eastings         : int 418487
    ##  $ min_northings        : int 431541
    ##  $ max_eastings         : int 419039
    ##  $ max_northings        : int 432041

Notes
-----

Currently, there is a limit to the number of API calls. However, [postcodes.io](https://postcodes.io/) provides full list of geolocation data that can be used locally without limitations. The original data is sourced from [Office for National Statistics Data Portal](https://geoportal.statistics.gov.uk/geoportal/catalog/main/home.page). That [file](https://github.com/ideal-postcodes/postcodes.io/blob/master/latest) is rather large so I didn't include it in the package.

For more info see the original [documentation](https://postcodes.io/docs).

The reference manual can be accessed [here](https://github.com/erzk/PostcodesioR/blob/master/PostcodesioR.pdf). Go to my [blog](https://walczak.org/tag/postcodesior/) for more examples.
