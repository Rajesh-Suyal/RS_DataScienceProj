
# We will create a fuction named 'Agg_sale_Prod' this fuction will read local csv file and print Average, Maximum and Minimum sales by Product.

Agg_sale_Prod <- function(directory, ProdGrp) {
  
  #Full path of the local csv file.
  fpath <- paste(directory, "/" , "Product Sales Report.csv", sep = "")
  
  #Reading csv file.
  x_data <- read.csv(fpath)
  
  #New empty dataframe is created.
  AggSale <- data.frame(Product_Name = character(0), 
                        Average_Sales = numeric(0), 
                        Maximum_Sales = numeric(0), 
                        Minimun_Sales = numeric(0), 
                        stringsAsFactors = FALSE)
  
  #For loop on the Region names. 'regiName' is a charactor vector.
  for( i in 1:length(ProdGrp)) {
    
    #Calculate Total Sales for a region.
    AvgSales <- mean(subset(x_data[,4], x_data[,8] == ProdGrp[i]))
    MaxSales <- max(subset(x_data[,4], x_data[,8] == ProdGrp[i]))
    MinSales <- min(subset(x_data[,4], x_data[,8] == ProdGrp[i]))
    
    #Apending data to Region dataframe, with Region Name and the Total Sales Amount.
    AggSale <- rbind.data.frame(AggSale, data.frame(Product_Name = ProdGrp[i], 
                                                    Average_Sales = AvgSales,
                                                    Maximum_Sales = MaxSales,
                                                    Minimun_Sales = MinSales))
  }
  
  #Returing AggSale object
  return(AggSale)
  
}


#creating charactor vector fDir for file path.
fDir <- "D:/Users/rsuyal/Documents/R/Working Directory/User Data Files/New folder/Data files"

#Call to function 'Agg_sale_Prod' and passing parameter values

Agg_sale_Prod(fDir, c("Appliances","Binders and Binder Accessories","Bookcases","Chairs & Chairmats","Computer Peripherals","Copiers and Fax",
                      "Envelopes","Labels","Office Furnishings","Office Machines","Paper","Pens & Art Supplies","Rubber Bands","Scissors, Rulers and Trimmers",
                      "Storage & Organization","Tables","Telephones and Communication"))