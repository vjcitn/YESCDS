library(shiny)
library(devtools)

server = function(input, output) {
 devtools::source_gist("https://gist.github.com/vjcitn/0e1b0289eb1a219b98d60b5b863f8d62")
 output$stuff = renderPrint({
  input$query
  dat = isolate(use_bert(input$in1))
  as.data.frame(dat)
 })
}
