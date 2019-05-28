
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Mpg prediction from mtcars dataset"),
    
    # Sidebar
    sidebarLayout(
        sidebarPanel(
            h3(helpText("Choose values:")),
            numericInput("hp", label = h4("hp"), step = 1, value = 145),
            selectInput("cyl", label = h4("cyl"), 
                        choices = list("unspecified" = "*", "4" = "4", "6" = "6", "8" = "8"))
        ),
        
        # Prediction and a plot
        mainPanel(
            h4("Predicted mpg of a car with a given horsepower and number of cylinders would be:"),
            h3(textOutput("result")),
            h4(""),
            h4("Regression results:"),
            plotOutput("distPlot"),
            h5("Blue line is the linear regression for the specified conditions, with the smoothed conditional mean in gray.")
            
        )
    )
))