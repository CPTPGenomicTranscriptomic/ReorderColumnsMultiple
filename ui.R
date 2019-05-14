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

ui <- tagList(
  dashboardPage(
    dashboardHeader(
      title = "Reoreder columns of multiple files",
      titleWidth = 380
    ),
    dashboardSidebar(
       fileInput("file", h3("Upload a file with the desired column order"), multiple = FALSE,
                accept = c("text/csv", "text/comma-separated-values, text/plain", ".csv")),
      br(),
      fileInput("files", h3("Upload a list of file to reoreder"), multiple = TRUE,
                accept = c("text/csv", "text/comma-separated-values, text/plain", ".csv")),
      br(),
      h3("Export data to a text file"),
      downloadButton("downloadData", "Download", icon("paper-plane"),
                     style="color: #fff; background-color: maroon; 
                     border-color: black")
      
      
      ),
    body <- dashboardBody(
      tags$head(
        tags$link(rel="stylesheet", type = "text/css", href = "custom.css"),
        tags$head(includeScript("google-analytics.js"))
      ),#background = "light-blue",height = 330, width = 100, 
      #      box(collapsible=T,
      #          tags$h3("About"),
      #          tags$p("This application obtains the coordinates and description of genes in 
      #                 a gene list."),
      #          tags$h3("Instructions"),
      #          tags$ol(
      #            tags$li("Select a species"),
      #            tags$li("Choose your options"),
      #            tags$li("Upload a file genelist/sample dataset"),
      #            tags$li("Wait ..."),
      #            tags$li("Done!"),
      #            tags$li("If you wish, you may export the table by clicking on the 'Download' button")
      #          ),
      #          tags$h3("Contact"), 
      #          tags$p("Manuel LEBEURRIER","[manuel.lebeurrier@inserm.fr]", br(), tags$a(href="https://www.cptp.inserm.fr/en/technical-platforms/genomic-and-transcriptomic/", "Genomic and transcriptomic platform CPTP", target="_blank"))
      #          ),
      fluidPage(
        column(width = 10, box(collapsible=T, title = "Results", width = NULL, status = "primary", div(style = 'overflow-x: scroll', tableOutput("output_geneids"))))
        #tableOutput("output_geneids"))
      )
    ),
    skin="red")
)
