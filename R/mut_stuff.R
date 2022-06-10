#' check all columns for presence of symbol in a SE with ragged mutation matrix as assay
#' @param sym character(1) HUGO symbol
#' @param se a SummarizedExperiment instance with ragged mutation matrix as assay
#' @return a vector of logicals, one for each column; uses `%in%`
#' @examples
#' data(brcamutSE)
#' table(has_mut_in("TTN", brcamutSE))
#' @export
has_mut_in = function (sym, se) 
  apply(SummarizedExperiment::assay(se), 2, function(x) sym %in% x)


