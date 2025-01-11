library(dplyr)
library(arrow)

arrow::write_dataset(iris[-1, ], "iris.parquet")
con = arrow::open_dataset("iris.parquet")

ch <- unique(iris$Species)

con |>
  filter(Species %in% ch) |>
  collect()
