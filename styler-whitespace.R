if (length(missing_cols) > 0) {
  cli::cli_abort(
    class = "not noise_params",
    message = c(
      "Can't convert {.arg data} to {.cls noise_params}.",
      "i" = paste(
        "The column{?s}: {.strong {.var {missing_cols}}}",
        "{?is/are} missing."
      )
    )
  )
}