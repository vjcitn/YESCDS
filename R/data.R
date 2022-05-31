#' geographic information from statcrunch.com on metropolitan statistical areas
#' @docType data
#' @format data.frame
"statcrunch_msa"

#' locations of US counties
#' @docType data
#' @import sf
#' @format sf instance
"us_county_geo"

#' cancer rate data by metropolitan statistical area, 1999-2018, from CDC WONDER system
#' @docType data
#' @format data.frame
#' @note Created by joining statcrunch location data to result of WONDER request.
#' See woncan_meta for details.
"woncan"

#' metadata on cancer rate data by metropolitan statistical area, 1999-2018, from CDC WONDER system
#' @docType data
#' @format character
"woncan_meta"

#' a table of data of Vince's contacts who developed cancer
#' @docType data
#' @format data.frame
"vjc_cancer_net"

#' a table of cancer rate data by country, retrieved from https://gco.iarc.fr/today/online-analysis-map
#' @docType data
#' @format data.frame
"world_cancer_2020_all"

#' a simple features (sf) instance with boundaries and centroids for 241 countries or other political geographic entities
#' @docType data
#' @format sf
"world_geo_sf"

#' a data.frame with clinical features of a breast cancer study (METABRIC) derived from cBioPortal
#' @docType data
#' @format data.frame
"metabric"

#' a data.frame with clinical features of a metastatic prostate adenocarcinoma study
#' @docType data
#' @import data.table
#' @format data.frame
"prostate_met_adeno"

#' a data.frame with (rounded) crude rates of cancer as presented at https://www.statcan.gc.ca/en/dai/btd/asr 
#' @docType data
#' @format data.frame
"canada_crude"

#' a data.frame with SEER estimates of cancer incidence for 2018
#' @docType data
#' @format data.frame
#' @note Collected at \url{https://seer.cancer.gov/statistics/preliminary-estimates/data-downloads/Feb-2019-Preliminary-Estimates.xlsx} on May 27 2022.  Notes include: "The estimates in this file are preliminary estimates for the November 2019 SEER submission based on the February 2019 SEER submission. These rates are subject to change prior to the official SEER release of estimates in April 2020.
#' Source: SEER 18 areas (San Francisco, Connecticut, Detroit, Hawaii, Iowa, New Mexico, Seattle, Utah, Atlanta, San Jose-Monterey, Los Angeles, Alaska Native Registry, Rural Georgia, California excluding SF/SJM/LA, Kentucky, Louisiana, New Jersey and Georgia excluding ATL/RG).
#' Rates are per 100,000 and are age-adjusted to the 2000 US Std Population (19 age groups - Census P25-1130).
"SEER_2018"

#-rw-r--r--  1 vincentcarey  staff   31905 Mar 31 07:34 prostate_met_adeno.rda
#-rw-r--r--  1 vincentcarey  staff   79469 Mar 31 06:24 metabric.rda
#-rw-r--r--  1 vincentcarey  staff     444 Mar 20 14:14 vjc_cancer_net.rda
#-rw-r--r--  1 vincentcarey  staff  814098 Mar 20 08:56 world_geo_sf.rda
#-rw-r--r--  1 vincentcarey  staff    2787 Mar 20 08:52 world_cancer_2020_all.rda
