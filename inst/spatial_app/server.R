
library(shiny)
library(png)
library(SingleCellExperiment)
library(ggplot2)
library(plotly)

server = function(input, output) {
 output$hne = renderPlot({
  fi = "hcc1hires.png"
  if (input$pick == "6NR") fi = "hccnr6he.png"
  z = readPNG(fi)
  plot(c(0,400), c(0,400), type="n", axes=FALSE, xlab=" ", ylab=" ")
  rasterImage(z, 0, 0, 400, 400)
  })
 output$jour = renderPlot({
  fi = "newjour1.png"
  if (input$pick == "6NR") fi = "jour6nr.png"
  z = readPNG(fi)
  plot(c(0,400), c(0,400), type="n", axes=FALSE, xlab=" ", ylab=" ")
  rasterImage(z, 0, 0, 400, 400)
  })
 output$key = renderPlot({
  z = readPNG("key.png")
  plot(c(0,400), c(0,400), type="n", axes=FALSE, xlab=" ", ylab=" ")
  rasterImage(z, 0, 0, 250, 400)
  })
 output$visium = renderPlotly({
  if (input$pick == "1R") process1R()
  else if (input$pick == "6NR") process6NR()
  })
 process1R = reactive({
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
  plotly::ggplotly(pl)
  })
 process6NR = reactive({
  load("hcc6nrYES.rda")
  assn = hcc6nrYES$clustid+1
  classes = c("Tum/PRSS1", "Tum/PRSS1", "Tum/AFP", "Tum/HBA2", "CAF", "Tum/CYP2E1",
       "U1", "U2", "CAF")
  clvec = classes[assn]
  dat = data.frame(x=hcc6nrYES$array_col, y=hcc6nrYES$array_row, clust=factor(clvec))
  colarr = c("1"="lightblue", "2"="lightblue", "3"="darkgoldenrod", "4"="purple", "5"="lightgreen", "6"="steelblue3",
   "7"="black", "8"="yellow", "9"="lightgreen")
  names(colarr) = classes
  pl = ggplot2::ggplot(dat, aes(y=-y,x=x,colour=clust,text=clust)) + ggplot2::geom_point(size=.6) +
   scale_colour_manual(values=colarr) 
  plotly::ggplotly(pl)
  })
}

