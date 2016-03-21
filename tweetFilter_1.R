# Install and Activate Packages. If you get an error, try installing the packages one at a time.
install.packages("streamR", "RCurl", "ROAuth", "RJSONIO")
library(streamR)
library(RCurl)
library(RJSONIO)
library(stringr)

# PART 1: Declare Twitter API Credentials & Create Handshake
library(ROAuth)
requestURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"
consumerKey <- "ENTER YOUR API CONSUMER KEY HERE"
consumerSecret <- "ENTER YOUR API CONSUMER SECRET HERE"

my_oauth <- OAuthFactory$new(consumerKey = consumerKey,
                             consumerSecret = consumerSecret,
                             requestURL = requestURL,
                             accessURL = accessURL,
                             authURL = authURL)

my_oauth$handshake(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))

### STOP HERE!!! ###

# PART 2: Save the my_oauth data to an .Rdata file. Run this command independently to the previous one.
save(my_oauth, file = "my_oauth.Rdata")