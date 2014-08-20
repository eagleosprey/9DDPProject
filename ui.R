library(shiny)
shinyUI(fluidPage(
      titlePanel("Repair Cost Prediction"),

      sidebarPanel(
            sliderInput('cycleCount', 'Cycle Count', 
                         min= 500, max= 300000, value= 50000, step=500),
            br(),
            radioButtons("ModelCode", "Model",
                  c("Model 1"= 1,
                    "Model 2"= 2,
                    "Model 4"= 4 ,
                    "Model 6"= 6), selected = 1),
            br(),
            submitButton("Submit"),
            br(),br(),
            h4("Instructions"),
            helpText("To predict costs for a future month, ",
                "use the slider to specify the cycle count ",
                "for the beginning of that month. Then select a ",
                "model number. Click on Submit for the prediction")
            ),
            
      mainPanel(
            h3("Results of prediction"),
            h4("Cycle Count Entered"),
            verbatimTextOutput("ocycleCount"),
            h4("Model Entered"),
            verbatimTextOutput("oModelCode"),
            h4("Prediction for Monthly Repair Cost"),
#            verbatimTextOutput("prediction")
            dataTableOutput("prediction")
            )
        )
)