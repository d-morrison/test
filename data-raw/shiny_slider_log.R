# from https://stackoverflow.com/questions/37853223/r-shiny-using-log-scale-slider-for-values-from-0-01-to-100

library(ggplot2)
conflicts_prefer(shiny::sliderInput)
# Global variables
from <- seq(1, 100, 1)
data <- (rexp(100, 0.05))
df1 <- as.data.frame(cbind(from, data))

JScode <-
  "$(function() {
setTimeout(function(){
var vals = [0];
var powStart = -2;
var powStop = 2;
for (i = powStart; i <= powStop; i++) {
var val = Math.pow(10, i);
val = parseFloat(val.toFixed(8));
vals.push(val);
}
$('#slider1').data('ionRangeSlider').update({'values':vals})
}, 10)})"

ui <-
  shinyUI(fluidPage(tabsetPanel(tabPanel(
    "", " ",
    fluidRow(
      column(
        width = 6,
        tags$head(tags$script(HTML(JScode))),
        sliderInput(
          "slider1",
          "bounds",
          min = 0,
          max = 100,
          value = c(0, 100)
        )
      ),
      column(width = 6, " ",
             plotOutput("plot7"))
    )
  ))))

server <- function(input, output) {
  filedata <- reactive({
    infile <- input$datafile
    if (is.null(infile)) {
      return(df1) # this returns the default .Rds - see global variables
    }
    temp <- read.csv(infile$datapath)
    #return
    temp[order(temp[, 1]),]
  })
  output$plot7 <- renderPlot({
    ggplot(df1, aes(sample = data)) +
      stat_qq() +
      scale_y_log10(limits = c(0.01,100)) + # set limits to plot reproducible images
      geom_hline(aes(yintercept = c(0,10^seq(-2,2))[input$slider1[1]+1])) + # low bound
      geom_hline(aes(yintercept = c(0,10^seq(-2,2))[input$slider1[2]+1])) + # high bound
      labs(title = "Q-Q Plot", x = "Normal Theoretical Quantiles", y = "Normal Data Quantiles")
  })
}

shinyApp(ui = ui, server = server)
