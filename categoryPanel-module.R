categoryPanelUI = function(id, nice){
  ns = NS(id)
  tabPanel(title = nice,
           value = id,
           tabsetPanel(id = ns("page"),
             tabPanel(value = "p1",
                      glue::glue("Page 1 for {id}"),
                      sliderTextUI(ns("one"))
             ),
             tabPanel(value = "p2",
                      glue::glue("Page 2 for {id}"),
                      sliderTextUI(ns("two"))                                         )
           )
  )
}

categoryPanel = function(input, output, session){
  callModule(sliderText, "one")
  callModule(sliderText, "two")
}