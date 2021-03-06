% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/postcode_query.R
\name{postcode_query}
\alias{postcode_query}
\title{Postcode query}
\usage{
postcode_query(postcode, limit = 10)
}
\arguments{
\item{postcode}{A string. Valid UK postcode.}

\item{limit}{An integer. Limits the number of matches to return. Defaults to 10. Needs to be less than 100.}
}
\value{
A list of geographic properties.
To return a data frame use \link[PostcodesioR]{postcode_lookup}.
}
\description{
Submit a postcode query and receive a complete list of postcode matches and all associated postcode data.
}
\examples{
\donttest{
postcode_query("EC1Y8LX")
postcode_query("EC1", limit = 11)
}

}
