library(shiny)

age <- function(){
  data <- read.table("data.txt", sep = ";", header = TRUE, encoding = "UTF-8")
  return(data[, 1])
}

shinyUI(pageWithSidebar(
  headerPanel("The number of population in Ivano-Frankivsk"),
  
  sidebarPanel(
    selectInput("age", "Age:", choices=age()),
    hr(),
    checkboxInput("total", "Show the total value", value = TRUE)
  ),
  
  mainPanel(
    plotOutput("plot")
  )
))