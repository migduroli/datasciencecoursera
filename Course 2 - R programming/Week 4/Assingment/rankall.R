#########################################################
#   Solution 3:
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


rankall <- function(outcome, num = "best") 
{
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ## Check that state and outcome are valid
    testOutcome <- TRUE
    outcomeFullName <- convertOutcomeName(outcome,data)
    allStates <- unique(data$State)
    numStates <- length(allStates)
    Hospitals <- rep("x",numStates)
   
    for (i in 1:numStates)        
        Hospitals[i] <- getHospitalNameByRank(data,allStates[i],
                                              outcomeFullName,num)
    
    df <- data.frame(hospital = Hospitals, state = allStates)
    df <- df[order(df$state),]
    
    return(df)
}

head(rankall("heart attack", 20), 10)
tail(rankall("pneumonia", "worst"), 3)
tail(rankall("heart failure"), 10)
