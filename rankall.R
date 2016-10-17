rankall <- function(outcome, num = "best") {
 
  g_Wd <- getwd()
  
  ## User prompt for source file location
  setwd(readline(prompt = "Enter the source file path:- ")) 
 
  ## Reading the Source File 
  data.Outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character", stringsAsFactors=FALSE)
  setwd(g_Wd) 
  
  
  ## creating a mapping for column no with outcome argument. Also, checking if the outcome values are valid.
  col_map <- if (outcome == "heart attack") {
    11 
  } else if(outcome == "heart failure") {
    17  
  } else if(outcome == "pneumonia") {
    23
  } else {
    stop("invalid Outcome")
  }
  
  ## Taking the subset of data for Hospital Name, State and Outcome columns
  data_st <- data.Outcome[,c(2, 7, col_map)]
  ## Removing the bigger dataset.
  rm(data.Outcome)
  ## Sorting data with state name in alphabetical order.
  data_st <- data_st[order(data_st[,2], decreasing = FALSE, na.last = TRUE),]
  ## Taking the unique values for state name.
  state_nm <- unique(data_st[, 2])
  ## Creating dummy vector for storing output result.
  data_out <- vector()
  
  ## Itrating to each state names in data set.
  for (i in 1:length(state_nm)) {
    
    ### Taking the subset of data for each state names.
    data_state <- data_st[data_st$State == state_nm[i],]
  
    ### Converting the type values.
    data_state[, 3] <- suppressWarnings(as.numeric(data_state[, 3])) # converting to numeric
    data_state[, 2] <- as.character(data_state[, 2]) # converting to string
    data_state[, 1] <- as.character(data_state[, 1]) # converting to string
    
    ### Sorting the result with Outcome values in desending order.
    data_state <- data_state[order(data_state[,3], data_state[,1], decreasing = FALSE, na.last = TRUE),]
    
    ### Checking and assigning num values.
    iCout <-  if(num == "best"){
      1
    }else if(num == "worst") {
      nrow(data_state)
    }else {
      num
    }
    
    
    ### stoing output results to dummy variables
    if(iCout < nrow(data_st)) {
      
      host_na <- data_state[iCout, 1]
      state <- state_nm[i]
      
    } else {
      host_na <- NA
      state <- NA
    }
    
    ### Adding hospital name and state values to vector
    data_out <- append(data_out, c(host_na, state))      
      
  }
  

  ## Converting vector --> Matrix then --> Dataframe.
  data_out <- as.data.frame(matrix(data_out, length(state_nm), 2, byrow = TRUE))
  ## Assigning column names of data frame
  colnames(data_out) <- c("Hospital Name", "State")
  ## Returning output
  return(data_out)
  
}

head(rankall("heart attack", 20), 10)
rankall("heart attack", 20)
