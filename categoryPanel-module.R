categoryPanelUI = function(id){
  ns = NS(id)
  tabPanel(id,
           tabsetPanel(
             tabPanel(glue::glue("Page 1 for {id}"),
                      sliderTextUI(ns("one"))
             ),
             tabPanel(glue::glue("Page 2 for {id}"),
                      sliderTextUI(ns("two"))                                         )
           )
  )
}

categoryPanel = function(input, output, session){
  callModule(sliderText, "one")
  callModule(sliderText, "two")
}