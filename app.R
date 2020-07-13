library(shiny)
source("slider-module.R")
source("categoryPanel-module.R")
ui = navbarPage("Testing Shiny modules",
               navlistPanel(
                   id = "test",
                   categoryPanelUI("A"),
                   categoryPanelUI("B"),
                   categoryPanelUI("C")
               )
    )

server = function(input, output) {
    callModule(categoryPanel, "A")
    callModule(categoryPanel, "B")
    callModule(categoryPanel, "C")
}

shinyApp(ui = ui, server = server)
