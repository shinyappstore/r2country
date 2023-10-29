# application UI object
# [1] "ID"              "name"            "continent"       "capital"
# [5] "currency"        "symbol"          "isocode"         "fractionalunity"
# [9] "population2023"
ui <- fluidPage(
  # Theme: Select color style from 1-13
  style = "9",
  # add scripts
  #custom.bg.color = "brown",
  tags$head(
    tags$script(src = "script.js"),
    tags$link(rel = "stylesheet", href = "style.css")
  ),
  # Header: Insert header content using titlePanel ------------
  header = nextGenShinyApps::titlePanel(left = "Learn about countries with the {r2country} package", right = "@obinna.obianom"),
  useShinyjs(), #use shiny js
  initStore(), #use shinyStorePlus
  row(
    column(
      width = 12,
      div(id="returnres1"),
      card(
        title = "Visualize continent ⇉ country ⇉ capital",
        collapsibleTree(
          final.dt,
          hierarchy = c("continent", "name", "capital"),
          root = "Continents",
          width = "100%",
          fontSize = 12,
          height = 650,
          zoomable = TRUE
        ),
        collapsed = TRUE
      ),
      card(
        title = "Visualize continent ⇉ country ⇉ population as of 2023",
        collapsibleTree(
          final.dt,
          hierarchy = c("continent", "name", "population2023"),
          root = "Continents",
          width = "100%",
          fontSize = 12,
          height = 600,
          zoomable = TRUE
        ),
        collapsed = TRUE
      ),
      card(
        title = "Visualize continent ⇉ country ⇉ official languages",
        collapsibleTree(
          final.dt,
          hierarchy = c("continent", "name", "officiallanguage"),
          root = "Continents",
          width = "100%",
          fontSize = 12,
          height = 600,
          zoomable = TRUE
        ),
        collapsed = TRUE
      ),
      card(
        title = "Visualize Currencies and Fractional Units of European Countries",
        collapsibleTree(
          final.dt[final.dt$continent == "Europe",],
          hierarchy = c("name", "currency2","fractionalunity"),
          root = "Europe",
          width = "100%",
          fontSize = 12,
          height = 650,
          zoomable = TRUE
        ),
        collapsed = TRUE
      ),
      card(
        title = "Visualize Currencies and Fractional Units of African Countries",
        collapsibleTree(
          final.dt[final.dt$continent == "Africa",],
          hierarchy = c("name", "currency2","fractionalunity"),
          root = "Africa",
          width = "100%",
          fontSize = 12,
          height = 650,
          zoomable = TRUE
        ),
        collapsed = TRUE
      ),
      card(
        title = "Visualize Currencies and Fractional Units of Asian Countries",
        collapsibleTree(
          final.dt[final.dt$continent == "Asia",],
          hierarchy = c("name", "currency2","fractionalunity"),
          root = "Asia",
          width = "100%",
          fontSize = 12,
          height = 650,
          zoomable = TRUE
        ),
        collapsed = TRUE
      ),

      div(
        id = "conversationcnt",
        class = "bg-success-600 text-white p-4 rounded",
        div(id = "conversionitemcontainer",
            div(class="initial-statment",
                tags$h3("Welcome to the demo of country datasets within  {r2country}."),br(),
                tags$h3("This dashboard allows you to play with various country datasets within the {r2country} R package using an
                        interactive interface built using the {collapsibleTree} and {nextGenShinyApps} packages"),
                tags$hr(),
                tags$h3("Datasets within the {r2country} package are"),
                tags$ul(
                  tags$li("country_continent:  continents of the world"), # continents
                  tags$li("country_calling_code:  country calling codes"), #
                  tags$li("country_language:  languages of all countries"), #
                  tags$li("country_names:  names of all countries"), #
                          tags$li("country_capital: capitals of all countries"), # capitals
                                  tags$li("country_money: currencies of all countries"), # currencies
                                          tags$li("country_population: population of all countries") # population)
                ),tags$h5("Enjoy using the dashboard!")


            )),
        h2(tableOutput("names")),
        shiny::tags$span(id="converted")
      )


    )
  )
)



