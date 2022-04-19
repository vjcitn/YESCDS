#us_map() |> 
#  addCircleMarkers(lat=wc_stom$lat, 
#                   lng=wc_stom$lng, 
#                   radius=.8*wc_stom$rate, 
#                   popup=htmlEscape(paste("STOMACH: ",wc_stom$rate)))

#woncan_types = function() {
#  data("woncan", package="YESCDS")
#  sort(unique( woncan$`Cancer Sites`))
#}
#
#filter_woncan = function(site) {
#  stopifnot(site %in% woncan_types())
#  woncan |> filter(`Cancer Sites` == site) |> mutate(aarate=Age.Adjusted.Rate)
#}


library(shiny)
library(leaflet)

server = function(input, output, session) {
    
   output$basic = renderLeaflet({
    validate(need(isTRUE(is.numeric(input$scaling)), "provide numeric scaling value"))
    dat = filter_woncan(site=input$site)
    validate(need(nrow(dat)>0, "site selected has no records"))
    suppressWarnings({
      m = us_map() |> addCircleMarkers(lat=dat$lat, lng=dat$lng, radius=input$scaling * dat$aarate,
          #popup=htmltools::htmlEscape(paste( dat$msa, "<br>", input$site, ": ", dat$aarate, sep="")))
          popup=(paste( dat$msa, "<br>", input$site, ": ", dat$aarate, sep="")))
      })
    m
    })
   output$tab = renderDataTable({
    filter_woncan(site=input$site)
    })
        
   output$desc = renderPrint( packageDescription("YESCDS") )
   observeEvent(input$stopBtn, {
       stopApp(returnValue=NULL)   # could return information here
      })
}

