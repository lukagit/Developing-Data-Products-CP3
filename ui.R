
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
            h4("Predicted value of this diamond is:"),
            h3(textOutput("result")),
            h4(""),
            h4("Regression results:"),
            plotOutput("distPlot")
            
        )
    )
))