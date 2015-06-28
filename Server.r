library('shiny')
‪#‎library‬(datasets)

shinyServer(function(input,output){


output$distPlot <- renderPlot({

# generate an rnorm distribution and plot it
datapoints<-read.csv(file = 'Data.csv', header=T,nrows=as.numeric(input$nrows), sep=',');
x<-datapoints[,input$Attribute];
newlist<-na.omit(x);
centers=input$cluster;
results<-kmeans(newlist, centers=3);
plot(newlist,col=results$cluster,xlab="person(number of observation)",ylab=input$Attibute)

})

});
