add_missing_column <- function(tbl, data) {
  
  new_inputs <- tbl$inputs
  new_inputs$percent <- "column"
  new_inputs$data <- data |> 
    dplyr::filter(is.na(.data[[tbl$inputs$by]]))
  new_inputs$by <- NULL
  
  tbl2 <- do.call(gtsummary::tbl_summary, new_inputs)
  
  by_label <- 
    labelled::get_label_attribute(data[[tbl$inputs$by]]) |> 
    dplyr::coalesce(tbl$inputs$by)
  
  list(tbl, tbl2) |> 
    tbl_merge(tab_spanner = c(glue::glue("**{by_label}**"), "**Missing**"))
}