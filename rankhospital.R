# Ranking hospitals by outcome in a state

rankhospital <- function(state, outcome, num = "best") {

  ## Read outcome data
  dir_f_assi2 <- "D:/Users/rsuyal/Documents/R/Working Directory/User Data Files/New folder"
  fname1_assi2 <- "outcome-of-care-measures"
  data.Outcome <- read.csv(paste(dir_f_assi2, "/", fname1_assi2, ".csv", sep = ""), colClasses = "character")
  
  ## Check that state and outcome are valid
  
  ## setting defaults for function arguments and flags.
  valid.Outcome <- c("heart attack", "heart failure", "pneumonia")
  valid.Outcome.flag  <-  FALSE
  valid.State <- unique(as.character(data.Outcome$State))
  valid.State.flag <- FALSE
  
  ## creating a mapping for column no with outcome argument.
  col_map <- if (outcome == "heart attack") {
    11 
  } else if(outcome == "heart failure") {
    17  
  } else if(outcome == "pneumonia") {
    23
  }
  
  
  ## checking if valid Outcome and State values are provided.
  ## if outcome and state values are not valid function will terminate with a message.
  if(outcome %in% valid.Outcome) {
    
    valid.Outcome.flag <-  TRUE
  }
  
  if(state %in% valid.State) {
    
    valid.State.flag <-  TRUE
  }
  
  
  if (valid.Outcome.flag == FALSE) {
    
    stop("invalid Outcome")
    
  } else if (valid.State.flag == FALSE) {
    
    stop("invalid State")
  }
  
  ## Taking the subset of data for State and Outcome columns
  data_st <- data.Outcome[data.Outcome$State == state,c(2, col_map)]
  
 
  
  ##sorting the hospital names in alphabetical order and display the first one from the list.
  data_st[, 2] <- suppressWarnings(as.numeric(data_st[, 2]))
  data_st[, 1] <- as.character(data_st[, 1])
  
  
  #data_st[with(data_st, order(data_st[,col_map], data_st[,2], na.last = NA))]
  data_st <-  data_st[order(data_st[,2], data_st[,1], decreasing = FALSE, na.last = NA),]
  
    if(num == "best") {
      data_st[1,1]
  } else if(num == "worst") {
    data_st[nrow(data_st),1]
  } else if (num > nrow(data_st)) {
    return(NA)
  } else{
    data_st[num,1]
  }
  
}


rankhospital("TX", "heart failure", 4)
rankhospital("MD", "heart attack", "worst")
rankhospital("MN", "heart attack", 5000)