
library(shiny)
library(ggplot2)
library(dplyr)
# select columns to be used in the analysis
cars <- mtcars
# Define server logic required to draw a plot
shinyServer(function(input, output) {
    output$distPlot <- renderPlot({
        # select diamonds depending of user input
        cars <- filter(mtcars, grepl(input$cyl, cyl))
        # build linear regression model
        fit <- lm( mpg~hp, cars)
        # predicts the price 
        pred <- predict(fit, newdata = data.frame(hp = input$hp, cyl = input$cyl))
        # Drow the plot using ggplot2
        plot <- ggplot(data=cars, aes(x=hp, y = mpg))+
            geom_point(aes(color = cyl), alpha = 0.3)+
            geom_smooth(method = "lm")+
            geom_vline(xintercept = input$hp, color = "green")+
            geom_hline(yintercept = pred, color = "red")
        plot
    })
    output$result <- renderText({
        # renders the text for the prediction below the graph
        cars <- filter(cars, grepl(input$cyl, cyl))
        fit <- lm( mpg~hp, cars)
        pred <- predict(fit, newdata = data.frame(hp = input$hp, cyl = input$cyl))
        res <- paste(round(pred, digits = 2), "$")
        res
    })
    
})