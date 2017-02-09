#########################################################
# Reading from Application Programing Interfaces (APIs)
#########################################################

twitterAPI <- "https://api.twitter.com/1.1/statuses/home_timeline.json"

library(httr)
myapp <- oauth_app("twitter",
                   key = "key",
                   secret = "secret")

sig <- sign_oauth1.0(myapp,
                     token = "token",
                     token_secret = "secret")

library(jsonlite)

homeTL <- GET(twitterAPI,sig)

stop_for_status(homeTL)

json1 <- content(homeTL)
json2 <- jsonlite::fromJSON(toJSON(json1))
# look first entry:
json2[1,1:4]



# have a look at GET, POST, PUT, DELETE
#
# twitterPOST <- "https://api.twitter.com/1.1/statuses/update.json"
# posted_tweet  <- POST(url = twitterPOST, sig,
#                       body = sprintf("status=%s","First text"))

