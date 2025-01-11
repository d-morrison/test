example_code <- '
check_strata <- function(pop_data, strata) {if (!is.character(strata)) {
    cli::cli_abort(
      class = "strata are not strings",
      message = c("x" = "Argument `strata` is not a character vector.",
      "i" = "Provide a character vector with names of stratifying variables.")
    )
  }
}
'
library(styler)
example_code |>
  styler::style_text() |>
  print()
example_code |>
  styler::style_text(style = tidyverse_style) |>
  print()
value <- my_function(arg0 = 0, arg1 = 1, arg2 = 2, arg3 = 3, arg4 = 4, arg5 = 5, arg6 = 6, arg7 = 7)

tmp1 = tempfile()
test_code = 
'
strata_is_empty <-
  missing(strata) ||
  is.null(strata) ||
  setequal(strata, NA) ||
  setequal(strata, "")
'

strata_is_empty <-
  missing(strata) ||
    is.null(strata) ||
    setequal(strata, NA) ||
    setequal(strata, "")

styler::style_text(test_code)

test_code |> styler::style_text() |> writeLines(tmp1)

lintr::lint_dir(dirname(tmp1))
