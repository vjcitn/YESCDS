library(shiny)
library(png)
library(SingleCellExperiment)
library(ggplot2)
library(plotly)

ui = fluidPage(
 sidebarLayout(
  sidebarPanel(
   helpText("select"), width=2
   ),
  mainPanel(
   tabsetPanel(
    tabPanel("H+E", plotOutput("hne", height="600px", width="600px")),
    tabPanel("Journal", fluidRow(
            column(width=7,plotOutput("jour",
                height="400px", width="400px")),
            column(width=5,plotOutput("key")))),
    tabPanel("ST", plotlyOutput("visium")),
    tabPanel("about", helpText("in development"))
    )
   )
  )
 )

server = function(input, output) {
 output$hne = renderPlot({
  z = readPNG("hcc1hires.png")
  plot(c(0,400), c(0,400), type="n", axes=FALSE, xlab=" ", ylab=" ")
  rasterImage(z, 0, 0, 400, 400)
  })
 output$jour = renderPlot({
  z = readPNG("newjour1.png")
  plot(c(0,400), c(0,400), type="n", axes=FALSE, xlab=" ", ylab=" ")
  rasterImage(z, 0, 0, 400, 400)
  })
 output$key = renderPlot({
  z = readPNG("key.png")
  plot(c(0,400), c(0,400), type="n", axes=FALSE, xlab=" ", ylab=" ")
  rasterImage(z, 0, 0, 250, 400)
  })
 output$visium = renderPlotly({
  load("hcc1rYES.rda")
  assn = hcc1rYES$clustid+1
  classes = c("Tum/SAA1", "M0a", "Tum/HP", "M0b", "CAF", "Tum/CYP2E1",
       "U1", "U2", "U3")
  clvec = classes[assn]
  dat = data.frame(x=hcc1rYES$array_col, y=hcc1rYES$array_row, clust=factor(clvec))
  colarr = c("1"="darkblue", "2"="orange", "3"="purple", "4"="red", "5"="lightgreen", "6"="steelblue3",
   "7"="black", "8"="yellow", "9"="gold")
  names(colarr) = classes
  pl = ggplot2::ggplot(dat, aes(y=x,x=y,colour=clust,text=clust)) + ggplot2::geom_point() +
   scale_colour_manual(values=colarr) 
  plotly::ggplotly(pl)# + layout(height=500, width=500)
  })
}

runApp(list(ui=ui, server=server))

