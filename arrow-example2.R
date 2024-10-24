dir.create("data", showWarnings = FALSE)
library(arrow)
pq_path <- "data/starwars"
starwars |>
  group_by(homeworld) |>
  write_dataset(path = pq_path, format = "parquet")

starwars2 <- open_dataset(
  sources = pq_path
)
starwars2 |> filter(homeworld %in% c("Geonosis", "Alderaan")) |> collect()
starwars2 |> filter(species == "Droid") |> head() |> collect()
head(starwars)