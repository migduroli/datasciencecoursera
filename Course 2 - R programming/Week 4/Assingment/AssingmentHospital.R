#########
## TESTS:
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

# example:
in_state <- "TX"
in_outcome <- names(outcome)[11]

names_states <- unique(outcome$State)

names_outcome <- names(outcome)[c(11,17,23)] 
#[1] "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack" 
#[2] "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
#[3] "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia" 

# Test in_state and in_oucome are correct:
 ( any(in_state == names_states) && any(in_outcome == names_outcome))

# Test "heart attack" is in in_outcome 
# grep("heart",in_outcome,ignore.case = TRUE)
strtest<- "heart attack"

strtestsplit <- unlist(strsplit(strtest,split = " "))
find_name <- sapply(strtestsplit,
                    function(e){grep(e,in_outcome,ignore.case = TRUE) } )
# The test:
(sum(find_name) == length(strtestsplit))


UnitTest <- function( func, setData, setSol , tol = 1e-7)
{
    (sqrt(sum(func(setData) - setSol)^2) <= tol)
}

#############################################################
# Start: 1
#############################################################
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


#########################################################
#   Test 2:
#########################################################

Texas <- subset(outcome, State == "TX")
order(Texas[[in_outcome]],Texas$Hospital.Name)
TexasRank <- order(Texas[[in_outcome]],Texas$Hospital.Name)
Texas[[in_outcome]][TexasRank]

#########################################################
#   Solution 2:
#########################################################

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

# tests
rankhospital("MN", "heart attack", 5000)
rankhospital("MD", "heart attack", "worst")
rankhospital("TX", "heart failure", 4)

#########################################################
#   Test 3:
#########################################################
 allStates <- unique(outcome$State)




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
    {
        Hospitals[i] <- getHospitalNameByRank(data,allStates[i],
                                               outcomeFullName,num)
    }

    df <- data.frame(hospital = Hospitals, 
                     state = allStates)
    df <- df[order(df$state),]
    
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    return(df)
}



