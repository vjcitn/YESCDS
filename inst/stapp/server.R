
library(YESCDS)
library(shiny)
library(plotly)
library(ggplot2)

  
  server = function(input, output) {
   data("woncan", package="YESCDS")
   sites = unique(woncan$`Cancer Sites`)
   ss = strsplit(woncan$msa, ", ")
   woncan$state = sapply(ss, "[", 2)
   sitetxt = reactive( paste("CDC 1999-2018 rates for", paste(input$casite, collapse=", ") ))
   output$boxes = renderPlotly({
    validate(need(length(input$casite) > 0, "please select one or more body sites"))
    validate(need(nchar(input$casite) > 0, "please select one or more body sites"))
    dat = woncan |> filter(`Cancer Sites` %in% input$casite)
    #boxplot(split(dat$Age.Adjusted.Rate, dat$state))
    g = ggplot(dat, aes(y=Age.Adjusted.Rate, x=state)) + geom_boxplot(aes(group=state)) + theme(axis.text.x = element_text(angle = 90)) + ggtitle( sitetxt() )
    ggplotly(g, tooltip="text")
   })
   output$hist = renderPlotly({
    validate(need(length(input$casite > 0), "please select one or more body sites"))
    dat = woncan |> filter(`Cancer Sites` %in% input$casite)
    #boxplot(split(dat$Age.Adjusted.Rate, dat$state))
    g = ggplot(dat, aes(x=Age.Adjusted.Rate, text=msa)) + geom_histogram(aes(text=msa)) + ggtitle( sitetxt() )
    ggplotly(g)
   })
    observeEvent(input$stopBtn, {
       stopApp(returnValue=NULL)   # could return information here
      })
  }
