#' give URL for responder example
#' @export
url_1R = function()
"https://mghp.osn.xsede.org/bir190004-bucket01/BiocYESdata/hcc1rYES.rda"

#' give URL for non-responder example
#' @export
url_6NR = function()
"https://mghp.osn.xsede.org/bir190004-bucket01/BiocYESdata/hcc6nrYES.rda"

#' retrieve or cache SingleCellExperiment data for spatial transcriptomics of HCC
#' @import BiocFileCache
#' @param sample character(1) either "1R" or "6NR"
#' @param cache cache instance likely inheriting from BiocFileCache::BiocFileCache
#' @note \url{https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM7661255} is
#' the basis for the "1R" example.
#' \url{https://pubmed.ncbi.nlm.nih.gov/37723590/} is the primary paper.
#' @return character(1) path to rda file
#' @export
get_hcc_spatial_path = function(sample="1R", cache = BiocFileCache::BiocFileCache()) {
  stopfinot(sample %in% c("1R", "6NR"))
  src = url_6NR()
  if (sample == "1R") src = url_1R()
  q = BiocFileCache::bfcquery(cache, basename(src))
  nans = nrow(q)
  if (nans >= 1) {
    q = q[nans,]
    return(q$rpath)  # quietly return last
    }
  p = BiocFileCache::bfcadd(cache, rname=src,
    action="copy", download=TRUE)
  p
  }
