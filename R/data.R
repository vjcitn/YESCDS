#' geographic information from statcrunch.com on metropolitan statistical areas
#' @docType data
#' @format data.frame
"statcrunch_msa"

#' locations of US counties
#' @docType data
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
#' @format data.frame
"prostate_met_adeno"

#-rw-r--r--  1 vincentcarey  staff   31905 Mar 31 07:34 prostate_met_adeno.rda
#-rw-r--r--  1 vincentcarey  staff   79469 Mar 31 06:24 metabric.rda
#-rw-r--r--  1 vincentcarey  staff     444 Mar 20 14:14 vjc_cancer_net.rda
#-rw-r--r--  1 vincentcarey  staff  814098 Mar 20 08:56 world_geo_sf.rda
#-rw-r--r--  1 vincentcarey  staff    2787 Mar 20 08:52 world_cancer_2020_all.rda
