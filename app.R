library(shiny)
source("slider-module.R")
source("categoryPanel-module.R")
ui = navbarPage("Testing Shiny modules",
               navlistPanel(
                   id = "letter",
                   categoryPanelUI("A", nice = "Apple"),
                   categoryPanelUI("B", nice = "Banana"),
                   categoryPanelUI("C", nice = "Carrot")
               )
    )

server = function(input, output, session) {
    callModule(categoryPanel, "A")
    callModule(categoryPanel, "B")
    callModule(categoryPanel, "C")

    observe({
      # Trigger this observer every time an input changes
      reactiveValuesToList(input)
      session$doBookmark()
    })
    onBookmarked(function(url) {
      updateQueryString(url)
    })
    
    setBookmarkExclude(c("A-one-slider", "A-two-slider", 
                         "B-one-slider", "B-two-slider",
                         "C-one-slider", "C-two-slider"))
    }

shinyApp(ui = ui, server = server, enableBookmarking = "url")
