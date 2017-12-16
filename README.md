PostcodesioR
================

[![Travis-CI Build Status](https://travis-ci.org/erzk/PostcodesioR.svg?branch=master)](https://travis-ci.org/erzk/PostcodesioR) [![Coverage Status](https://img.shields.io/codecov/c/github/erzk/PostcodesioR/master.svg)](https://codecov.io/github/erzk/PostcodesioR?branch=master) [![Package-License](http://img.shields.io/badge/license-GPL--3-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-3.0.html) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/PostcodesioR)](https://cran.r-project.org/package=PostcodesioR)

An API wrapper around [postcodes.io](https://postcodes.io/) - free UK postcode lookup and geocoder.

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
lookup_result <- postcode_lookup("EC1Y8LX")

#overview
str(lookup_result)
```

    ## 'data.frame':    1 obs. of  29 variables:
    ##  $ postcode                  : chr "EC1Y 8LX"
    ##  $ quality                   : int 1
    ##  $ eastings                  : int 532544
    ##  $ northings                 : int 182128
    ##  $ country                   : chr "England"
    ##  $ nhs_ha                    : chr "London"
    ##  $ longitude                 : num -0.0909
    ##  $ latitude                  : num 51.5
    ##  $ european_electoral_region : chr "London"
    ##  $ primary_care_trust        : chr "Islington"
    ##  $ region                    : chr "London"
    ##  $ lsoa                      : chr "Islington 023D"
    ##  $ msoa                      : chr "Islington 023"
    ##  $ incode                    : chr "8LX"
    ##  $ outcode                   : chr "EC1Y"
    ##  $ parliamentary_constituency: chr "Islington South and Finsbury"
    ##  $ admin_district            : chr "Islington"
    ##  $ parish                    : chr "Islington, unparished area"
    ##  $ admin_county              : logi NA
    ##  $ admin_ward                : chr "Bunhill"
    ##  $ ccg                       : chr "NHS Islington"
    ##  $ nuts                      : chr "Haringey and Islington"
    ##  $ admin_district            : chr "E09000019"
    ##  $ admin_county              : chr "E99999999"
    ##  $ admin_ward                : chr "E05000367"
    ##  $ parish                    : chr "E43000209"
    ##  $ parliamentary_constituency: chr "E14000764"
    ##  $ ccg                       : chr "E38000088"
    ##  $ nuts                      : chr "UKI43"

#### Multiple postcodes

``` r
pc_list <- list(postcodes = c("PR3 0SG", "M45 6GN", "EX165BL"))
bulk_lookup_result <- bulk_postcode_lookup(pc_list)

#overview
str(bulk_lookup_result$result[1])
```

    ## List of 1
    ##  $ :List of 2
    ##   ..$ query : chr "EX165BL"
    ##   ..$ result:List of 23
    ##   .. ..$ postcode                  : chr "EX16 5BL"
    ##   .. ..$ quality                   : int 1
    ##   .. ..$ eastings                  : int 294480
    ##   .. ..$ northings                 : int 112251
    ##   .. ..$ country                   : chr "England"
    ##   .. ..$ nhs_ha                    : chr "South West"
    ##   .. ..$ longitude                 : num -3.5
    ##   .. ..$ latitude                  : num 50.9
    ##   .. ..$ european_electoral_region : chr "South West"
    ##   .. ..$ primary_care_trust        : chr "Devon"
    ##   .. ..$ region                    : chr "South West"
    ##   .. ..$ lsoa                      : chr "Mid Devon 005C"
    ##   .. ..$ msoa                      : chr "Mid Devon 005"
    ##   .. ..$ incode                    : chr "5BL"
    ##   .. ..$ outcode                   : chr "EX16"
    ##   .. ..$ parliamentary_constituency: chr "Tiverton and Honiton"
    ##   .. ..$ admin_district            : chr "Mid Devon"
    ##   .. ..$ parish                    : chr "Tiverton"
    ##   .. ..$ admin_county              : chr "Devon"
    ##   .. ..$ admin_ward                : chr "Westexe"
    ##   .. ..$ ccg                       : chr "NHS Northern, Eastern and Western Devon"
    ##   .. ..$ nuts                      : chr "Devon CC"
    ##   .. ..$ codes                     :List of 7
    ##   .. .. ..$ admin_district            : chr "E07000042"
    ##   .. .. ..$ admin_county              : chr "E10000008"
    ##   .. .. ..$ admin_ward                : chr "E05003531"
    ##   .. .. ..$ parish                    : chr "E04003055"
    ##   .. .. ..$ parliamentary_constituency: chr "E14000996"
    ##   .. .. ..$ ccg                       : chr "E38000129"
    ##   .. .. ..$ nuts                      : chr "UKK43"

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
    ##   ..$ northings     : int 181623
    ##   ..$ eastings      : int 534749
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

    ##  NULL

#### Multiple postcodes

To reverse geocode multiple values use the function underneath. The result is a nested list, which might be a bit intimidating, but it allows storing unequal lengths of elements.

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

bulk_rev_geo$result[[1]]$result[[1]]
```

    ## $postcode
    ## [1] "CF24 2BT"
    ## 
    ## $quality
    ## [1] 1
    ## 
    ## $eastings
    ## [1] 319675
    ## 
    ## $northings
    ## [1] 176305
    ## 
    ## $country
    ## [1] "Wales"
    ## 
    ## $nhs_ha
    ## [1] "Cardiff and Vale University Health Board"
    ## 
    ## $longitude
    ## [1] -3.158077
    ## 
    ## $latitude
    ## [1] 51.47998
    ## 
    ## $european_electoral_region
    ## [1] "Wales"
    ## 
    ## $primary_care_trust
    ## [1] "Cardiff and Vale University Health Board"
    ## 
    ## $region
    ## NULL
    ## 
    ## $lsoa
    ## [1] "Cardiff 038D"
    ## 
    ## $msoa
    ## [1] "Cardiff 038"
    ## 
    ## $incode
    ## [1] "2BT"
    ## 
    ## $outcode
    ## [1] "CF24"
    ## 
    ## $distance
    ## [1] 2.639788
    ## 
    ## $parliamentary_constituency
    ## [1] "Cardiff South and Penarth"
    ## 
    ## $admin_district
    ## [1] "Cardiff"
    ## 
    ## $parish
    ## [1] "Splott"
    ## 
    ## $admin_county
    ## NULL
    ## 
    ## $admin_ward
    ## [1] "Splott"
    ## 
    ## $ccg
    ## [1] "Cardiff and Vale University Health Board"
    ## 
    ## $nuts
    ## [1] "Cardiff and Vale of Glamorgan"
    ## 
    ## $codes
    ## $codes$admin_district
    ## [1] "W06000015"
    ## 
    ## $codes$admin_county
    ## [1] "W99999999"
    ## 
    ## $codes$admin_ward
    ## [1] "W05000879"
    ## 
    ## $codes$parish
    ## [1] "W04000863"
    ## 
    ## $codes$parliamentary_constituency
    ## [1] "W07000080"
    ## 
    ## $codes$ccg
    ## [1] "W11000029"
    ## 
    ## $codes$nuts
    ## [1] "UKL22"

Common usage of this function might be extracting particular variables. You can extract one variable like this:

``` r
# extract one postcode
bulk_rev_geo$result[[1]]$result[[8]]$postcode
```

    ## [1] "CF24 2AL"

But more likely you will want more than one result. After all, that's the point of using a bulk function:

``` r
# function to extract variables of interest
extract_bulk_geo_variable <- function(x) {
  bulk_results <- lapply(bulk_rev_geo$result, `[[`, "result")
  sapply(unlist(bulk_results, recursive = FALSE), `[[`, x)
}

# define the variables you need
variables_of_interest <- c("postcode", "latitude", "longitude")

# return a data frame with the variables
data.frame(
  sapply(variables_of_interest, extract_bulk_geo_variable))
```

    ##    postcode         latitude         longitude
    ## 1  CF24 2BT 51.4799810730482 -3.15807708496285
    ## 2  CF24 2ED 51.4796962780375 -3.15868908771903
    ## 3  CF24 2AA  51.480214120738 -3.15906222875833
    ## 4  CF24 5NW 51.4793656523229 -3.15847910268578
    ## 5  CF24 2AJ  51.480686989214 -3.15852699155627
    ## 6  CF24 2AH 51.4805572928224 -3.15891252296984
    ## 7  CF24 2DZ 51.4801105864152 -3.15679871749552
    ## 8  CF24 2AL 51.4808346636567 -3.15814191348464
    ## 9  PO33 1PS 50.7188151075122 -1.12929804319882
    ## 10 PO33 1PT 50.7185750818924 -1.12846672060095
    ## 11 PO33 1QB 50.7170474559076 -1.12982656563728
    ## 12 PO33 1PX 50.7178907506146 -1.12714786456114
    ## 13 PO33 1QD 50.7172032703058 -1.12781222816285
    ## 14 PO33 1PU 50.7184669311199  -1.1260322523645
    ## 15 PO33 1PZ 50.7162328095008 -1.12791522396325
    ## 16 PO33 1QR 50.7157418306917 -1.12599793035477
    ## 17 PO33 1PB 50.7210243159623 -1.13371950415272
    ## 18 PO33 1PR  50.721487986434  -1.1331867990148
    ## 19 PO33 1PY 50.7151718843021 -1.12674508376803
    ## 20 PO33 1QP 50.7155625975698 -1.12488225387235
    ## 21 PO34 5AP 50.7214660528318 -1.12423400885574

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

    ##   postcode quality eastings northings country           nhs_ha  longitude
    ## 1  RH5 6DU       1   517010    153370 England South East Coast -0.3241882
    ##   latitude european_electoral_region primary_care_trust     region
    ## 1 51.26748                South East             Surrey South East
    ##               lsoa            msoa incode outcode
    ## 1 Mole Valley 009D Mole Valley 009    6DU     RH5
    ##   parliamentary_constituency admin_district    parish admin_county
    ## 1                Mole Valley    Mole Valley Mickleham       Surrey
    ##                         admin_ward              ccg        nuts
    ## 1 Mickleham, Westhumble and Pixham NHS Surrey Downs East Surrey
    ##   admin_district admin_county admin_ward    parish
    ## 1      E07000210    E10000030  E05007326 E04009573
    ##   parliamentary_constituency       ccg  nuts
    ## 1                  E14000824 E38000177 UKJ26

A randomly generated postcode can also belong to a particular outcode:

``` r
# restrict to an outcode
random_postcode("N1")
```

    ##   postcode quality eastings northings country nhs_ha   longitude latitude
    ## 1   N1 4NU       1   533161    184928 England London -0.08097636 51.54754
    ##   european_electoral_region primary_care_trust region           lsoa
    ## 1                    London          Islington London Islington 012B
    ##            msoa incode outcode parliamentary_constituency admin_district
    ## 1 Islington 012    4NU      N1            Islington North      Islington
    ##                       parish admin_county admin_ward           ccg
    ## 1 Islington, unparished area           NA    Mildmay NHS Islington
    ##                     nuts admin_district admin_county admin_ward    parish
    ## 1 Haringey and Islington      E09000019    E99999999  E05000377 E43000209
    ##   parliamentary_constituency       ccg  nuts
    ## 1                  E14000763 E38000088 UKI43

#### Places

You can also generate a random place, specified by an OSGB code, with corresponding geographic information:

``` r
random_place()
```

    ##                   code       name_1 name_1_lang name_2 name_2_lang
    ## 1 osgb4000000074564499 Seana Bhaile        NULL   NULL        NULL
    ##   local_type outcode       county_unitary county_unitary_type
    ## 1     Hamlet     HS6 Na h-Eileanan an Iar    UnitaryAuthority
    ##   district_borough district_borough_type   region  country longitude
    ## 1             NULL                  NULL Scotland Scotland -7.239658
    ##   latitude eastings northings min_eastings min_northings max_eastings
    ## 1 57.50338    86287    858024        86052        857790        86552
    ##   max_northings
    ## 1        858290

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
    ##   ..$ european_electoral_region : chr "London"
    ##   ..$ primary_care_trust        : chr "Islington"
    ##   ..$ region                    : chr "London"
    ##   ..$ lsoa                      : chr "Islington 023D"
    ##   ..$ msoa                      : chr "Islington 023"
    ##   ..$ incode                    : chr "8LX"
    ##   ..$ outcode                   : chr "EC1Y"
    ##   ..$ distance                  : int 0
    ##   ..$ parliamentary_constituency: chr "Islington South and Finsbury"
    ##   ..$ admin_district            : chr "Islington"
    ##   ..$ parish                    : chr "Islington, unparished area"
    ##   ..$ admin_county              : NULL
    ##   ..$ admin_ward                : chr "Bunhill"
    ##   ..$ ccg                       : chr "NHS Islington"
    ##   ..$ nuts                      : chr "Haringey and Islington"
    ##   ..$ codes                     :List of 7
    ##   .. ..$ admin_district            : chr "E09000019"
    ##   .. ..$ admin_county              : chr "E99999999"
    ##   .. ..$ admin_ward                : chr "E05000367"
    ##   .. ..$ parish                    : chr "E43000209"
    ##   .. ..$ parliamentary_constituency: chr "E14000764"
    ##   .. ..$ ccg                       : chr "E38000088"
    ##   .. ..$ nuts                      : chr "UKI43"

You can also use outcodes:

``` r
near_outcode <- nearest_outcode("EC1Y")
# overview
str(near_outcode$result[2])
```

    ## List of 1
    ##  $ :List of 11
    ##   ..$ outcode       : chr "EC2Y"
    ##   ..$ longitude     : num -0.094
    ##   ..$ latitude      : num 51.5
    ##   ..$ northings     : int 181793
    ##   ..$ eastings      : int 532337
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
    ##   ..$ country       :List of 1
    ##   .. ..$ : chr "England"
    ##   ..$ distance      : num 396

### Find places

Provide a name of a place of interest. You can specify the number of results (default is 10):

``` r
place_query_result <- place_query("Hills", limit = 11)

# overview
str(place_query_result$result[1])
```

    ## List of 1
    ##  $ :List of 21
    ##   ..$ code                 : chr "osgb4000000074300875"
    ##   ..$ name_1               : chr "Hillside"
    ##   ..$ name_1_lang          : NULL
    ##   ..$ name_2               : NULL
    ##   ..$ name_2_lang          : NULL
    ##   ..$ local_type           : chr "Suburban Area"
    ##   ..$ outcode              : chr "BA2"
    ##   ..$ county_unitary       : chr "Bath and North East Somerset"
    ##   ..$ county_unitary_type  : chr "UnitaryAuthority"
    ##   ..$ district_borough     : NULL
    ##   ..$ district_borough_type: NULL
    ##   ..$ region               : chr "South West"
    ##   ..$ country              : chr "England"
    ##   ..$ longitude            : num -2.43
    ##   ..$ latitude             : num 51.3
    ##   ..$ eastings             : int 370229
    ##   ..$ northings            : int 157825
    ##   ..$ min_eastings         : int 369900
    ##   ..$ min_northings        : int 157565
    ##   ..$ max_eastings         : int 370400
    ##   ..$ max_northings        : int 158065

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
