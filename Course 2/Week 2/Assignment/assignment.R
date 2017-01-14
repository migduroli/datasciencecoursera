workingDirectory <- file.path("C:","Users","mdura","Desktop","datascience","Course 2",
                       "Week 2","Assignment",fsep = .Platform$file.sep)
setwd(workingDirectory)


############################################################
pollutantmean <- function(directory, pollutant, id = 1:332) {

    csvFiles = getFilesById(id, directory)
    
    dataFrames = readMultipleCsvFiles(csvFiles)
    
    dataFrame = bindMultipleDataFrames(dataFrames)
    
    getColumnMean(dataFrame, column = pollutant)
}


getFilesById <- function(id, directory = getwd()) {
    allFiles = list.files(directory)
    file.path(directory, allFiles[id])
}

readMultipleCsvFiles <- function(csvFiles) {
    lapply(csvFiles, read.csv)
}

bindMultipleDataFrames <- function(dataFrames) {
    Reduce(function(x, y) rbind(x, y), dataFrames)
}

getColumnMean <- function(dataFrame, column, ignoreNA = TRUE) {
    mean(dataFrame[ , column], na.rm = ignoreNA)
}

############################################################

getCompleteCases <- function(id, directory = getwd()) {
    path <- getFilesById(id, directory)
    sum(complete.cases(read.csv(path)))
}

complete <- function(directory, id = 1:332) {
    data.frame(id=id, nobs=mapply(getCompleteCases,id,directory))
}

############################################################

corr <- function(directory , threshold = 0) { 
    tcorr <- function(fname) {
        data <- read.csv(file.path(directory, fname))
        nobs <- sum(complete.cases(data))
        if (nobs > threshold) {
            return (cor(data$nitrate, data$sulfate, use="complete.obs"))
        }
    }
    tcorrs <- sapply(list.files(directory), tcorr) #get all correlations + NULLs
    tcorrs <- unlist(tcorrs[!sapply(tcorrs, is.null)]) #remove NULLs
    unname(tcorrs)
}

