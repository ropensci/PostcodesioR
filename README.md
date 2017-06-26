[![Travis-CI Build Status](https://travis-ci.org/erzk/PostcodesioR.svg?branch=master)](https://travis-ci.org/erzk/PostcodesioR) [![Coverage Status](https://img.shields.io/codecov/c/github/erzk/PostcodesioR/master.svg)](https://codecov.io/github/erzk/PostcodesioR?branch=master)

PostcodesioR
============

This package is a wrapper around [postcodes.io](https://postcodes.io/) which is a free Postcode lookup API and geocoder for the UK.

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
    ##   ..$ query : chr "M45 6GN"
    ##   ..$ result:List of 23
    ##   .. ..$ postcode                  : chr "M45 6GN"
    ##   .. ..$ quality                   : int 1
    ##   .. ..$ eastings                  : int 380416
    ##   .. ..$ northings                 : int 406002
    ##   .. ..$ country                   : chr "England"
    ##   .. ..$ nhs_ha                    : chr "North West"
    ##   .. ..$ longitude                 : num -2.3
    ##   .. ..$ latitude                  : num 53.6
    ##   .. ..$ parliamentary_constituency: chr "Bury South"
    ##   .. ..$ european_electoral_region : chr "North West"
    ##   .. ..$ primary_care_trust        : chr "Bury"
    ##   .. ..$ region                    : chr "North West"
    ##   .. ..$ lsoa                      : chr "Bury 019C"
    ##   .. ..$ msoa                      : chr "Bury 019"
    ##   .. ..$ incode                    : chr "6GN"
    ##   .. ..$ outcode                   : chr "M45"
    ##   .. ..$ admin_district            : chr "Bury"
    ##   .. ..$ parish                    : chr "Bury, unparished area"
    ##   .. ..$ admin_county              : NULL
    ##   .. ..$ admin_ward                : chr "Pilkington Park"
    ##   .. ..$ ccg                       : chr "NHS Bury"
    ##   .. ..$ nuts                      : chr "Greater Manchester North East"
    ##   .. ..$ codes                     :List of 6
    ##   .. .. ..$ admin_district: chr "E08000002"
    ##   .. .. ..$ admin_county  : chr "E99999999"
    ##   .. .. ..$ admin_ward    : chr "E05000677"
    ##   .. .. ..$ parish        : chr "E43000156"
    ##   .. .. ..$ ccg           : chr "E38000024"
    ##   .. .. ..$ nuts          : chr "UKD37"

#### Outward code lookup

Provide an outcode to obtain geolocation data for the centroid of the specifid outcode:

``` r
ocl <- outward_code_lookup("E1")

#overview
str(ocl)
```

    ## List of 2
    ##  $ status: int 200
    ##  $ result:List of 9
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
    ##   .. ..$ : chr "City of London, unparished area"
    ##   .. ..$ : chr "Hackney, unparished area"
    ##   .. ..$ : chr "Tower Hamlets, unparished area"
    ##   ..$ admin_county  : list()
    ##   ..$ admin_ward    :List of 13
    ##   .. ..$ : chr "Spitalfields & Banglatown"
    ##   .. ..$ : chr "Portsoken"
    ##   .. ..$ : chr "Tower"
    ##   .. ..$ : chr "St Dunstan's"
    ##   .. ..$ : chr "Aldgate"
    ##   .. ..$ : chr "Bishopsgate"
    ##   .. ..$ : chr "Hoxton East & Shoreditch"
    ##   .. ..$ : chr "Whitechapel"
    ##   .. ..$ : chr "Bethnal Green"
    ##   .. ..$ : chr "Shadwell"
    ##   .. ..$ : chr "Stepney Green"
    ##   .. ..$ : chr "St Peter's"
    ##   .. ..$ : chr "Weavers"

### Reverse geocoding

Provide latitude and longitude to obtain geographic information. Different levels of aggregation are available, i.e. postcode or outcode.

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
    ##  $ :List of 10
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
    ##   ..$ distance      : num 997

### Generate random entries

#### Postcodes

Generates a data frame with a random UK postcode and corresponding geographic information:

``` r
# without restrictions
random_postcode()
```

    ##   postcode quality eastings northings  country   nhs_ha longitude latitude
    ## 1 AB41 6QU       1   394212    822397 Scotland Grampian -2.097673 57.29215
    ##   parliamentary_constituency european_electoral_region
    ## 1                     Gordon                  Scotland
    ##                           primary_care_trust region
    ## 1 Aberdeenshire Community Health Partnership     NA
    ##                          lsoa                   msoa incode outcode
    ## 1 Balmedie and Potterton - 06 Balmedie and Potterton    6QU    AB41
    ##   admin_district parish admin_county admin_ward
    ## 1  Aberdeenshire     NA           NA         NA
    ##                                          ccg
    ## 1 Aberdeenshire Community Health Partnership
    ##                              nuts admin_district admin_county admin_ward
    ## 1 Aberdeen City and Aberdeenshire      S12000034    S99999999  S13002856
    ##      parish       ccg  nuts
    ## 1 S99999999 S03000013 UKM50

A randomly generated postcode can also belong to a particular outcode:

``` r
# restrict to an outcode
random_postcode("N1")
```

    ##   postcode quality eastings northings country nhs_ha   longitude latitude
    ## 1   N1 5RU       1   533241    183601 England London -0.08032523  51.5356
    ##     parliamentary_constituency european_electoral_region
    ## 1 Hackney South and Shoreditch                    London
    ##          primary_care_trust region         lsoa        msoa incode outcode
    ## 1 City and Hackney Teaching London Hackney 025C Hackney 025    5RU      N1
    ##   admin_district                   parish admin_county
    ## 1        Hackney Hackney, unparished area           NA
    ##                 admin_ward                  ccg               nuts
    ## 1 Hoxton East & Shoreditch NHS City and Hackney Hackney and Newham
    ##   admin_district admin_county admin_ward    parish       ccg  nuts
    ## 1      E09000012    E99999999  E05009377 E43000202 E38000035 UKI41

#### Places

You can also generate a random place, specified by an OSGB code, with corresponding geographic information:

``` r
random_place()
```

    ##                   code          name_1 name_1_lang name_2 name_2_lang
    ## 1 osgb4000000074318818 Whitmoor Bottom        NULL   NULL        NULL
    ##   local_type outcode county_unitary county_unitary_type district_borough
    ## 1     Hamlet    GU26         Surrey              County         Waverley
    ##   district_borough_type     region country  longitude latitude eastings
    ## 1              District South East England -0.7662108 51.11602   486456
    ##   northings min_eastings min_northings max_eastings max_northings
    ## 1    135916       485996        135838       486602        136348

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
    ##  $ :List of 10
    ##   ..$ outcode       : chr "EC2Y"
    ##   ..$ longitude     : num -0.0939
    ##   ..$ latitude      : num 51.5
    ##   ..$ northings     : int 181789
    ##   ..$ eastings      : int 532343
    ##   ..$ admin_district:List of 2
    ##   .. ..$ : chr "City of London"
    ##   .. ..$ : chr "Islington"
    ##   ..$ parish        :List of 2
    ##   .. ..$ : chr "Islington, unparished area"
    ##   .. ..$ : chr "City of London, unparished area"
    ##   ..$ admin_county  : list()
    ##   ..$ admin_ward    :List of 6
    ##   .. ..$ : chr "Bassishaw"
    ##   .. ..$ : chr "Coleman Street"
    ##   .. ..$ : chr "Clerkenwell"
    ##   .. ..$ : chr "Bunhill"
    ##   .. ..$ : chr "Cripplegate"
    ##   .. ..$ : chr "Aldersgate"
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
    ##   ..$ code                 : chr "osgb4000000074567818"
    ##   ..$ name_1               : chr "Hillside"
    ##   ..$ name_1_lang          : NULL
    ##   ..$ name_2               : NULL
    ##   ..$ name_2_lang          : NULL
    ##   ..$ local_type           : chr "Hamlet"
    ##   ..$ outcode              : chr "WV16"
    ##   ..$ county_unitary       : chr "Shropshire"
    ##   ..$ county_unitary_type  : chr "UnitaryAuthority"
    ##   ..$ district_borough     : NULL
    ##   ..$ district_borough_type: NULL
    ##   ..$ region               : chr "West Midlands"
    ##   ..$ country              : chr "England"
    ##   ..$ longitude            : num -2.59
    ##   ..$ latitude             : num 52.5
    ##   ..$ eastings             : int 359799
    ##   ..$ northings            : int 287859
    ##   ..$ min_eastings         : int 358944
    ##   ..$ min_northings        : int 287609
    ##   ..$ max_eastings         : int 360231
    ##   ..$ max_northings        : int 288109

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

Currently, there is a limit to the number of API calls. However, [postcodes.io](https://postcodes.io/) provides full list of geolocation data that can be used locally without limitations. The original data is sourced from [Office for National Statistics Data Portal](https://geoportal.statistics.gov.uk/geoportal/catalog/main/home.page). That [file](https://github.com/ideal-postcodes/postcodes.io/blob/master/latest) is rather large so I didn’t include it in the package.

For more info see the original [documentation](https://postcodes.io/docs).

The reference manual can be accessed [here](https://github.com/erzk/PostcodesioR/blob/master/PostcodesioR.pdf). Go to my [blog](https://walczak.org/tag/postcodesior/) for more examples.
