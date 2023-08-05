load_data_as_tibble <- function(url, destination_path) {
  download.file(url, destination_path)
  load(destination_path)
  # Assuming that the data loaded is named "gravier". 
  # If not, replace "gravier" with the correct name
  gravier_tibble <- as_tibble(get("gravier", envir = .GlobalEnv)) 
  return(gravier_tibble)
}

# Call the function
url <- "https://github.com/ramhiser/datamicroarray/blob/master/data/gravier.RData"
destination_path <- "gravier.RData"
gravier_tibble <- load_data_as_tibble(url, destination_path)

