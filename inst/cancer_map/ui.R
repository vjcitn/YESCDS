
library(shiny)
library(YESCDS) # gets leaflet, sf, etc.

#woncan_types = function() {
#  data("woncan", package="YESCDS")
#  sort(unique( woncan$`Cancer Sites`))
#}
#
#filter_woncan = function(site) {
#  stopifnot(site %in% woncan_types())
#  woncan |> filter(`Cancer Sites` == site) |> mutate(aarate=Age.Adjusted.Rate)
#}


ui = fluidPage(
 sidebarLayout(
  sidebarPanel(
   helpText(h2("Cancer mapping with R")),
   helpText("With decent internet, you can just pan and zoom with controls on the map."),
   selectInput("site", "Body site", choices=woncan_types(),
     selected="Stomach"),
   numericInput("scaling", "scaling", min=.1, max=10, value=1, step=.1),
   actionButton("stopBtn", "stop app"),
   width=3
  ),
  mainPanel(
   tabsetPanel(
    tabPanel("view", leafletOutput("basic")),
    tabPanel("tab", dataTableOutput("tab")),
    tabPanel("about", helpText("This app uses leaflet to explore site-specific cancer rates"),
      verbatimTextOutput("desc"))
   )
  )
 )
)
