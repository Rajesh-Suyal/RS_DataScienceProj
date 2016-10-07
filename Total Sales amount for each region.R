
# we will create a fuction named prod_sale_reg this fuction will read local csv file and print 
# total sales for each region.

prod_sale_reg <- function(directory, regiName) {
  
    #Full path of the local csv file.
    fpath <- paste(directory, "/" , "Product Sales Report.csv", sep = "")
    
    #Reading csv file.
    x_data <- read.csv(fpath)
    
    #New empty dataframe is created.
    Region <- data.frame(Region = character(0), Total_Sales = numeric(0), stringsAsFactors = FALSE)
    
    #For loop on the Region names. 'regiName' is a charactor vector.
    for( i in 1:length(regiName)) {
      
      #Calculate Total Sales for a region.
      totalSales <- sum(subset(x_data[,4], x_data[,7] == regiName[i]))
      
      #Apending data to Region dataframe, with Region Name and the Total Sales Amount.
      Region <- rbind.data.frame(Region, data.frame(Region = regiName[i], Total_Sales = totalSales))
    }
    
    #Returing Region object
    return(Region)
  
}


#creating charactor vector fDir for file path.
fDir <- "D:/Users/rsuyal/Documents/R/Working Directory/User Data Files/New folder/Data files"

#Call to function 'prod_sale_reg' and passing parameter values
prod_sale_reg(fDir, c("Alberta","British Columbia","Manitoba","New Brunswick","Newfoundland","Northwest Territories",
                      "Nova Scotia","Nunavut","Ontario","Prince Edward Island","Quebec","Saskachewan","Yukon"))
prod_sale_reg(fDir, c("Alberta","British Columbia","Manitoba"))
prod_sale_reg(fDir, c("Nova Scotia","Nunavut","Ontario","Prince Edward Island","Quebec","Saskachewan","Yukon"))
prod_sale_reg(fDir, "Nunavut")
