#Increase size of upload files to 500 Mo
options(shiny.maxRequestSize=500*1024^2)
options(warn=-1)

if (!require("shiny"))
  install.packages("shiny")  

if (!require("shinythemes"))
  install.packages('shinythemes')

if (!require("shinydashboard"))
  install.packages("shinydashboard")

if (!require("dplyr"))
  install.packages("dplyr")

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")


#source("https://bioconductor.org/biocLite.R")
library(shiny)
library(shinythemes)
library(shinydashboard)
library(dplyr)

server <- function(input, output) {
  output$inputFiles <- renderText({
    req(input$files)
    print(input$files$name)
  })
  
  datasetInput <- reactive({
    req(input$files)
    req(input$file)
    file <- input$file
    if (is.null(file)) {
      return(NULL)
    } else {
      theorder666 <- read.delim(file$datapath, stringsAsFactors = F, header=T)
    }
    files <- input$files
    if (is.null(files)) {
      return(NULL)
    }# else{
    # #go to a temp dir to avoid permission issues
    #  owd <- setwd(tempdir())
    #  on.exit(setwd(owd))
    #  files <- NULL;
    #}
    
    withProgress(message = 'Running:', value = 0, {
      print(files)
      for(i in 1:length(files$name)) {
        incProgress(i/(length(files$name)), detail = paste("Working on the file:", files$name[i]))
        withProgress(message = 'In progress:', value = 0, {
          incProgress(1/2, detail = "Reading input file.")
          # read input genes
          data1 <- data.frame(read.delim(files$datapath[i], stringsAsFactors = F, header=T))
          #print(data1)
          

          
          #Subsetting and writting files
          incProgress(2/2, detail = "Subsetting and writting.")
          write.table(data1[,colnames(theorder666)], files$name[i], sep = "\t", quote = F, row.names = F)
        })
      }
      print(paste0("If this message appears the program have reach the end! You can look at \"",getwd(),"\" directory to see the results or download them!"))
    })
  })

  output$output_geneids <- renderTable({
    options = list(scrollX = TRUE)
    datasetInput()
  })
  
  output$downloadData <- downloadHandler(
    filename = function(){
      paste("output", "zip", sep=".")
    },
    content = function(file){
      files <- NULL;
      for(i in 1:length(input$files$name)) {
        files <- c(input$files$name[i],files)
      }
      #create the zip file
      zip(file,files = files)
    },
    contentType = "application/zip"
  )
}
