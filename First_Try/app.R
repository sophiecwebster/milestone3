#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("x",
                        "Pick an x, any x:",
                        min = 1,
                        max = 50,
                        value = 30),
            textOutput("five_x")
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot"),
           textInput("name", "What's your name?"),
           textOutput("greetings")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$greetings <- renderText({
        paste0("Hello ", input$name, "!")
    })
   output$five_x <- renderText({
       paste0("Then, x multiplied by five is ", input$x * 5, ".")
   })
   }


# Run the application 
shinyApp(ui = ui, server = server)
