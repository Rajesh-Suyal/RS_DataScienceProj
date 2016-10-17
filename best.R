
#Finding the best hospital in a state

best <- function(state, outcome) {
  
  g_Wd <- getwd()
  
  ## User prompt for source file location
  setwd(readline(prompt = "Enter the source file path:- ")) 
  
  ## Read outcome data
  data.Outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  setwd(g_Wd)
  
  
  ## setting defaults for function arguments and flags.
  valid.Outcome <- c("heart attack", "heart failure", "pneumonia")
  valid.Outcome.flag  <-  FALSE
  valid.State <- unique(as.character(data.Outcome$State))
  valid.State.flag <- FALSE
  
  ##browser()
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
  
  ## Return hospital name in that state with lowest 30-day death
  data_st <- data.Outcome[data.Outcome$State == state,]
  class(data_st[,col_map]) <- suppressWarnings(as.numeric(data_st[,col_map]))
  min_val <- suppressWarnings(min(as.numeric(data_st[, col_map]), na.rm = TRUE))
  c_hospital_nm <- character(0)
  
  
  for (i in 1:nrow(data_st)) {
  
    xx <- suppressWarnings( as.numeric(data_st[i,col_map]))
    if(!is.na(xx) && xx == min_val ) {
      c_hospital_nm <- c(c_hospital_nm, data_st[i,2])
       
    }
   
 }
  
  ##sorting the hospital names in alphabetical order and display the first one from the list.
  
  order(c_hospital_nm, na.last = NA)
  return(c_hospital_nm[1])
}


best("TX", "heart attack")
best("TX", "heart failure")
best("MD", "heart attack")
best("MD", "pneumonia")
best("BB", "heart attack")
best("NY", "hert attack")
