library(shiny)
repairsClean <- read.csv("repairsClean.csv")
repairsClean$ModelCode <-as.factor(repairsClean$ModelCode)

fit1 <-lm(TotalRA ~ ModelCode + cycleCount, 
          data=repairsClean)


shinyServer(
    function(input, output) {
        predictModel <- reactive ({
            newdata <- data.frame(ModelCode = input$ModelCode, 
                            cycleCount = input$cycleCount)
            predict(fit1, newdata)
        })
 
        output$ocycleCount <- renderPrint({input$cycleCount})
        output$oModelCode <- renderPrint({input$ModelCode})
#        output$prediction <- renderDataTable({predictModel})
        output$prediction <- renderDataTable({
            print(predictModel())
            d=data.frame(prediction=as.vector(predictModel()))
            d
    })
})