ReorderColumnsMultiple
========
A shiny app reorder the columns of multiple files using one file as template.

*****

Launch ReorderColumnsMultiple directly from R and GitHub (preferred approach)

User can choose to run ReorderColumnsMultiple installed locally for a more preferable experience.

## Step 1: Install R and RStudio

Before running the app you will need to have R and RStudio installed (tested with R 3.5.3 and RStudio 1.1.463).  
Please check CRAN (<a href="https://cran.r-project.org/" target="_blank">https://cran.r-project.org/</a>) for the installation of R.  
Please check <a href="https://www.rstudio.com/" target="_blank">https://www.rstudio.com/</a> for the installation of RStudio. 
Please check <a href="https://cran.r-project.org/bin/windows/Rtools/" target="_blank">https://cran.r-project.org/bin/windows/Rtools</a> for the installation of Rtools.

## Step 2: Install the R Shiny package

Start an R session using RStudio and run this line:  
```
if (!require("shiny")){install.packages("shiny")}
```

## Step 3: Start the app  

Start an R session using RStudio and run this line:  
```
shiny::runGitHub("ReorderColumnsMultiple", "CPTPGenomicTranscriptomic")
```
This command will download the code of ReorderColumnsMultiple from GitHub to a temporary directory of your computer and then launch the ReorderColumnsMultiple app in the web browser. Once the web browser was closed, the downloaded code of ReorderColumnsMultiple would be deleted from your computer. Next time when you run this command in RStudio, it will download the source code of ReorderColumnsMultiple from GitHub to a temporary directory again. 

## Step 4: Choose your analysis set up  

**1. Upload the file with desired columns order:**

Upload a file containing the rigth column order.

The file must have the format text/csv, text/comma-separated-values, text/plain, or .csv extension to appear in the selection browser.

The app will just look at the first line of this file to identify the columns to print in output in the specified order.

The column names of this file should be exactly the same as the column names in the files to reorder and present in ALL the files.

If some column names aren't present in the file, these columns will not be printed in the output files.

**2. Upload a list of files to reorder:**

Upload from one to serveral files having a header (columns as first row) and containing at least the column names of the previous file.

The files must have the format text/csv, text/comma-separated-values, text/plain, or .csv extension to appear in the selection browser.

Be aware that the application is limited to 500Mo of RAM.

Multiple runs can be preferable in case of big data analyses.

The blue progress bar should move until the message \"upload complete\" appears.


**6. Export data to a text file:**

The button will create a zip file corresponding to all the input files annotated.

The webpage should look like this!

![alt text](https://github.com/CPTPGenomicTranscriptomic/ReorderColumnsMultiple/blob/master/ReorderColumnsMultiple_interface.png)
