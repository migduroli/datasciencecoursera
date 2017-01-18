#########################################################
#   Solution 2:
#########################################################
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

getHospitalNameByRank <- function(data, state, outcome, num)
{
    df <- subset(data, State == state)
    
    StateRanks <- order(suppressWarnings(as.numeric(df[[outcome]])),
                        df$Hospital.Name,
                        decreasing = FALSE)
    
    ordered <- df[StateRanks,]
    ordered[[outcome]] <- suppressWarnings(as.numeric(ordered[[outcome]]))
    ordered <- na.omit(ordered)
    
    
    len <- length(ordered[[outcome]])
    
    if (num == "best")
        return(ordered[1,]$Hospital.Name)
    else if (num == "worst")
        return(ordered[len,]$Hospital.Name)
    else if (num > len)
        return(NA)
    else if (num <= len)
        return(ordered[num,]$Hospital.Name)
}

rankhospital <- function(state, outcome, num = "best") 
{
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ## Check that state and outcome are valid
    
    testOutcome <- TRUE
    outcomeFullName <- convertOutcomeName(outcome,data)
    testState <- checkStateIsValid(state,outcomeFullName,data)
    
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    
    if(testState && testOutcome )
        return(getHospitalNameByRank(data,state,outcomeFullName,num))
}

# Tests
# print(rankhospital("TX", "heart failure", 4))
# print(rankhospital("MD", "heart attack", "worst"))
# print(rankhospital("MN", "heart attack", 5000))

# rankhospital("NC", "heart attack", "worst")
# [1] "WAYNE MEMORIAL HOSPITAL"
# rankhospital("WA", "heart attack", 7)
# [1] "YAKIMA VALLEY MEMORIAL HOSPITAL"
# rankhospital("TX", "pneumonia", 10)
# [1] "SETON SMITHVILLE REGIONAL HOSPITAL"
# rankhospital("NY", "heart attack", 7)
# [1] "BELLEVUE HOSPITAL CENTER"

# rm(list = ls())
