library(shiny)
library(datasets)
datapoints<-read.csv(file = 'Data.csv', header=T,nrows=5000, sep=',');
‪#‎HTML‬( body {background-color:‪#‎b0c4de‬;})

shinyUI(bootstrapPage(headerPanel("All about insights"),
‪#‎sidebarPanel‬(sliderInput("obs", "Numberofobservation", min=1, max=10, value=4)),
sidebarPanel(width = 5, 
selectInput(inputId = "nrows",
label = "Please, select the number rows of data to analyze",
choices = c(20,100, 1000,10000,100000),
selected = 100),

selectInput("Attribute", "Attributes of the CA data for plot", 
choices=colnames(datapoints),
selected="Min.Classification.Salary"),
selectInput("cluster", "Number of clusters",
choices=c(4,5,6,7),
selected= 4)

),

mainPanel(plotOutput("distPlot"),
plotOutput("x")

)

))
