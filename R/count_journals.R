#' Count journal references from a BibTeX file
#'
#' This function reads a BibTeX file, extracts the journal names from the entries,
#' and counts how many references come from each journal.
#'
#' @param bibtex_file Character. Path to the BibTeX file.
#'
#' @return A data frame with two columns:
#'   - `Journal`: The name of the journal.
#'   - `Count`: The number of references from the journal.
#'
#' The data frame is sorted in descending order of counts.
#'
#' @examples
#' \dontrun{
#' bibtex_file <- fs::path_package("extdata/example.bib", package = "test")
#' if (file.exists(bibtex_file)) {
#'   journal_counts <- count_journals(bibtex_file)
#'   print(journal_counts)
#' } else {
#'   cat("The specified BibTeX file does not exist. Please check the file path.\n")
#' }
#' }
#'
#' @importFrom RefManageR ReadBib
count_journals <- function(bibtex_file) {
  # Read the BibTeX file
  bib <- RefManageR::ReadBib(bibtex_file)
  
  # Extract journal names
  journals <- bib$journal
  
  # Check if there are any missing journal entries
  journals <- journals[!is.na(journals)]
  
  # Count occurrences of each journal
  journal_counts <- table(unlist(journals))
  
  # Convert to a data frame for easy viewing
  journal_counts_df <- as.data.frame(journal_counts)
  colnames(journal_counts_df) <- c("Journal", "Count")
  
  # Sort by count (descending order)
  journal_counts_df <- journal_counts_df[order(-journal_counts_df$Count), ]
  
  return(journal_counts_df)
}
