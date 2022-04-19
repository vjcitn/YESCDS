
library(shiny)
library(YESCDS) # gets leaflet, sf, etc.

providers_of_interest = c("CartoDB.PositronNoLabels", 
 "CartoDB.PositronOnlyLabels", 
 "Stamen.TonerBackground", 
 "Stamen.TonerLabels")

ui = fluidPage(
 sidebarLayout(
  sidebarPanel(
   helpText(h2("Basic overview of mapping with R")),
   helpText("With decent internet, you can just pan and zoom with controls on the map."),
   selectInput("provider", "type", choices=c("CartoDB", "Stamen"), 
     selected="Stamen"),
   helpText("Coordinates to start:"),
   numericInput("lng", "longitude", min=-360, max=360, value=-71.0589),
   numericInput("lat", "latitude", min=-360, max=360, value=42.3601),
   numericInput("zoom", "zoom", min=1, max=18, value=12),
   radioButtons("labs", "labels", choices=c("on", "off")),
   actionButton("stopBtn", "stop app"),
   width=3
  ),
  mainPanel(
   tabsetPanel(
    tabPanel("view", leafletOutput("basic")),
    tabPanel("about", helpText("This app uses leaflet to explore ways of presenting geographic maps"),
      verbatimTextOutput("desc"))
   )
  )
 )
)
