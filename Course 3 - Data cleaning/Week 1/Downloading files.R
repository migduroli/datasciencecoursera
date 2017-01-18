# Get and Set data:

# Reminder: the working directory (getwd() and setwd())

file.exists("dirName")# check the existence of a dir with a name
dir.create("dirName") # creates a directory if it does not exist

if(!file.exists("data")){
    dir.create("data")
}


## Getting data from the internet
#       download.file(...)

fileURL <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileURL, destfile = "./data/camera.csv", method = "curl")
# method = "curl" for https://...
list.files("./data")

# Remember to keep the version of the file:
dateDownloaded <- date()
dateDownloaded