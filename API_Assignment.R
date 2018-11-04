#Test file for API interface

#Reference manual available here: https://cran.r-project.org/web/packages/WikipediR/WikipediR.pdf

#Load API interface for Wikipedia
install.packages("WikipediR")
library(WikipediR)

#Get some pages in a specific category

pages = pages_in_category("en","wikipedia",categories="Post-Impressionism")
head(pages)
class(pages) 

#Above returns some messy data, but....
#Adding the option: clean_response = TRUE is much better. 

pages = pages_in_category("en","wikipedia",categories="Post-Impressionism", clean_response = TRUE) 
head(pages)
class(pages) 

#Set up boolean mask to identify where the record of interest is
mask = pages$title == "Pointillism"

#Apply boolean mask to obtain record of interest
pageOfInterest = pages[mask,]

#Get Content for pageOfInterest
content = page_content("en","wikipedia",page_name = pageOfInterest$title)

#display the structure of content: 
str(content)

