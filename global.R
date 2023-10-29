# prepare environment
quickcode::clean()
quickcode::libraryAll(shiny,  r2country, dplyr, ggplot2,
                      collapsibleTree, nextGenShinyApps, shinyjs, shinyStorePlus, clear = TRUE)

# app.version
app.version <- 0.2


# reactives
info.keep <- reactiveValues()
info.keep$files <-c()


# globalfunctions
error.out <- function(ret){
  print(ret)
  runjs(paste0("$('#returnres1').html('",ret,"')"))
}


final.dt <- country_names

for (cl in c(
  "country_continent", # continents
  "country_capital", # capitals
  "country_money", # currencies
  "country_language", # languages
  "country_population" # population
)) {
  final.dt <- merge(final.dt, get(cl), by = "ID")
}
final.dt$currency2 <- paste0(final.dt$currency," (",final.dt$symbol,") ")
final.dt$population2023 <- formatC(as.integer(final.dt$population2023), format="d", big.mark=",")
