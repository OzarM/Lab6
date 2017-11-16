draw <- function(age, total){
  data <- read.table("data.txt", sep = ";", header = TRUE, encoding = "UTF-8")
  
  index <- 0
  
  for(i in 1:nrow(data)){
    if(data[i, 1] == age){
      index <- i
    }
  }
  
  if(index == 0){
    return()
  }
  
  if(index > 2 && index < nrow(data)){
    title <- paste(age, "year", sep = " ")
  } else {
    title <- age
  }

  if(total){
    barplot(as.matrix(data[index, 2:4]), main = title, ylab="The number of population in Ivano-Frankivsk", xlab="Gender")
  } else {
    barplot(as.matrix(data[index, 3:4]), main = title, ylab="The number of population in Ivano-Frankivsk", xlab="Gender")
  }
}

shinyServer(
  function(input, output) {
    output$plot <- renderPlot({
      draw(input$age, input$total)
    })
  }
)