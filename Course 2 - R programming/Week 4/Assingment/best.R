#best.R
checkStateIsValid <- function (state, outcome, data)
{
    allStates <- unique(data$State) 
    fullNames <- names(data)[c(11,17,23)] 
    
    test <- (any(state == allStates) && any(outcome == fullNames))
    if(!test) stop(" : invalid state ")
    return(test)
}

convertOutcomeName <- function (name, data)
{
    allNames <- c("heart attack","heart failure","pneumonia")
    fullNames <- names(data)[c(11,17,23)] 
    testIn <- (name == allNames)
    
    if(any(testIn)) return(fullNames[testIn])
    else {
        testOutcome <<- FALSE
        stop(" : invalid outcome ")
    }
}

getLowestDeathRateId <- function(state,outcome, data)
{
    df <- subset(data, State == state)
    result <- df[suppressWarnings(which.min(as.numeric(df[[outcome]]))),]$Hospital.Name
    #result <- unname(tapply(df,which.min)[state])
    result
}

best <- function(state, outcome)
{
    ## Read data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ## Check validity of arguments
    testOutcome <- TRUE
    outcomeFullName <- convertOutcomeName(outcome,data)
    testState <- checkStateIsValid(state,outcomeFullName,data)
    
    ## Look for the minimum death rate
    if(testState && testOutcome) 
        return(getLowestDeathRateId(state,outcomeFullName,data))
}
# Test past!
best("TX", "heart attack")
#[1] "CYPRESS FAIRBANKS MEDICAL CENTER"
best("TX", "heart failure")
#[1] "FORT DUNCAN MEDICAL CENTER"
best("MD", "heart attack")
#[1] "JOHNS HOPKINS HOSPITAL, THE"
best("MD", "pneumonia")
#[1] "GREATER BALTIMORE MEDICAL CENTER"

best("SC", "heart attack")
#[1] "MUSC MEDICAL CENTER"
best("NY", "pneumonia")
#[1] "MAIMONIDES MEDICAL CENTER"
best("AK", "pneumonia")
#[1] "YUKON KUSKOKWIM DELTA REG HOSPITAL"