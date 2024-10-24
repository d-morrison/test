dir.create("data", showWarnings = FALSE)

curl::multi_download(
  "https://r4ds.s3.us-west-2.amazonaws.com/seattle-library-checkouts.csv",
  "data/seattle-library-checkouts.csv",
  resume = TRUE
)

seattle_csv <- open_dataset(
  sources = "data/seattle-library-checkouts.csv", 
  col_types = schema(ISBN = string()),
  format = "csv"
)

seattle_csv |> glimpse()

seattle_csv |> 
  group_by(CheckoutYear) |> 
  summarise(Checkouts = sum(Checkouts)) |> 
  arrange(CheckoutYear) |> 
  collect()

pq_path <- "data/seattle-library-checkouts"

seattle_csv |>
  group_by(CheckoutYear) |>
  write_dataset(path = pq_path, format = "parquet")