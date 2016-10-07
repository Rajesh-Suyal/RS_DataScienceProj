
# This function will do the aggrigation of Sales amount for specific regions.
# Here, same function can be used to calculate Total, Mean, Maximum and Minimum Sales amount.
# By default aggrigation will be Sum of Sales amount.
# Default region name is "Manitoba", but use can provide any region for computation.
# "Product Sales Report" is a local csv format data file.
aggr_fun <- function(directory, fName = "Product Sales Report", funct = sum, regName = "Manitoba") {
  
  filepath <- paste(directory, "/", fName, ".csv", sep = "")
  
  xdata <- read.csv(filepath)
  #paste(as.character(quote(funct)), "_of_amount")
 
  agg_out <- data.frame(col1 = character(0), col2 = numeric(0))
  
  for (i in length(regName) ) {
    
    agg_sale_amt <- funct(subset(xdata[,4], xdata[,7]==regName[i]))
    agg_out <- rbind.data.frame(agg_out, data.frame(col1 = regName[i], col2 = as.numeric(agg_sale_amt)))
    
    
  }
  
  if(identical(funct, mean) != TRUE) {
        strpos_1 <- gregexpr("\"", deparse(funct, width.cutoff = 20))[[1]][1] + 1
        strpos_2 <- gregexpr("\"", deparse(funct, width.cutoff = 20))[[1]][2] - 1
  
        str_t <- substr(deparse(funct, width.cutoff = 20), strpos_1, strpos_2)
  } else {
    strpos_1 <- gregexpr("\"", deparse(funct, width.cutoff = 20)[2])[[1]][1] + 1
    strpos_2 <- gregexpr("\"", deparse(funct, width.cutoff = 20)[2])[[1]][2] - 1
    
    str_t <- substr(deparse(funct, width.cutoff = 20)[2], strpos_1, strpos_2)
  }
  colnames(agg_out) <- c("Region Name", paste(str_t, "_of_amount", sep = ""))
  return(agg_out)
}


fil_dir<- "D:/Users/rsuyal/Documents/R/Working Directory/User Data Files/New folder/Data files"

aggr_fun(fil_dir)
aggr_fun(fil_dir, func = mean)
aggr_fun(fil_dir, func = max)
aggr_fun(fil_dir, func = min)

aggr_fun(fil_dir, regName = "Nunavut")
func <- sum