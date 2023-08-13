# function for downloading gravier dataset in IDE from data_microarray repository.
# change url if owner changes it
load_data_as_tibble <- function(url = 'ramhiser/datamicroarray') {
  library(devtools)
  if (!require(datamicroarray)) {
    install_github("ramhiser/datamicroarray")
    library(datamicroarray)
  } 
  data('gravier',
       package = 'datamicroarray')
  table_gravier <- as_tibble(gravier)
  return(table_gravier)
}
gravier_table <- load_data_as_tibble()

