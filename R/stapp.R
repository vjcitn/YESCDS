#' simple app to show different ways of examining variation over body sites and MSAs
#' @import shiny
#' @importFrom dplyr filter
#' @importFrom plotly ggplotly plotlyOutput renderPlotly
#' @rawNamespace import(ggplot2, except=last_plot)
#' @export
variation_app = function() {
 cwd = getwd()
 on.exit(setwd(cwd))
 setwd(system.file("stapp", package="YESCDS"))
 shiny::runApp()
}

variation_app_old = function() {
  data("woncan", package="YESCDS")
  sites = unique(woncan$`Cancer Sites`)
  ss = strsplit(woncan$msa, ", ")
  woncan$state = sapply(ss, "[", 2)
  
  ui = fluidPage(
   sidebarLayout(
    sidebarPanel(width=2,
     helpText("WONDER CDC Cancer rates"),
     selectInput("casite", "body site", choices=sort(sites),
       selected="Brain", multiple=TRUE)),
    mainPanel(
     tabsetPanel(
      tabPanel("bystate",
       plotlyOutput("boxes")
      ),
      tabPanel("histogram",
       plotlyOutput("hist")
      )
     )
    )
   )
  )
  
  server = function(input, output) {
   output$boxes = renderPlotly({
    dat = woncan |> filter(`Cancer Sites` %in% input$casite)
    #boxplot(split(dat$Age.Adjusted.Rate, dat$state))
    g = ggplot(dat, aes(y=Age.Adjusted.Rate, x=state)) + geom_boxplot(aes(group=state)) + theme(axis.text.x = element_text(angle = 90))
    ggplotly(g, tooltip="text")
   })
   output$hist = renderPlotly({
    dat = woncan |> filter(`Cancer Sites` %in% input$casite)
    #boxplot(split(dat$Age.Adjusted.Rate, dat$state))
    g = ggplot(dat, aes(x=Age.Adjusted.Rate, text=msa)) + geom_histogram(aes(text=msa))
    ggplotly(g)
   })
  }
  
  runApp(list(ui=ui, server=server))
}
