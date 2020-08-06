
library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            textInput("bins",
                        "Number of bins:", placeholder = "hola!!!!"),
            sliderInput("date", "Fechas", max = as.Date("07-07-2020", format = "%d-%m-%y"),
                        min = as.Date("01-01-2020", format = "%d-%m-%y"),
                        value = as.Date("01-01-2020", format = "%d-%m-%y")),
            sliderInput("breaklist", "Lista rota", min = 0, max = 20, value = 10 , step = 5,
                        animate = TRUE),
            numericInput("number", "Select a value", value = 150, min = 0, max = 1000, step = 50)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            shiny::textOutput("distPlot"),
            plotOutput("plot", click = "plot_click")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPrint({ input$plot_click })

    output$plot <- renderPlot({ plot(seq(1:100), rnorm(100)) })
}

# Run the application
shinyApp(ui = ui, server = server)
