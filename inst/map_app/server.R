library(shiny)
library(leaflet)

setup_display = function( m, prov, use_labels ) {
  if (prov == "CartoDB") {
    m = m |> addProviderTiles( "CartoDB.PositronNoLabels" )
    if (use_labels) m = m |> addProviderTiles ( "CartoDB.PositronOnlyLabels" )
    }
  else {
    m = m |> addProviderTiles( "Stamen.TonerBackground" )
    if (use_labels) m = m |> addProviderTiles ( "Stamen.TonerLabels" )
    }
  m
}

server = function(input, output, session) {
    
   output$basic = renderLeaflet({
    validate(need(isTRUE(is.numeric(input$zoom)), "provide numeric zoom value"))
    m = leaflet() |> setView(lng=input$lng, lat=input$lat, zoom=input$zoom) 
    setup_display( m, input$provider, input$labs == "on" )
    })
   output$desc = renderPrint( packageDescription("YESCDS") )
   observeEvent(input$stopBtn, {
       stopApp(returnValue=NULL)   # could return information here
      })
}

