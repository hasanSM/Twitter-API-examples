# Now we use the streamR package and the authorization we set up earlier to retrieve tweets.
library(streamR)
load("my_oauth.Rdata")

filterStream(file.name = "tweets.json", # Save tweets in a json file
             language = "en",
             location = c(-119, 33, -117, 35), # longitude/latitude pairs providing southwest and northeast corners of the bounding box. Make sure the order is long,lat.
             timeout = 60, # Keep connection alive for 60 seconds
             oauth = my_oauth) # Use my_oauth file as the OAuth credentials

# More parameter choices can be found on the streamR package's documentation.

# Next, parse the json file and save to a data frame called tweets.df.
# Simplify = FALSE ensures that we include lat/lon information in that data frame.

tweets.df <- parseTweets("tweets.json", simplify = FALSE)



# The filtering done by Twitter is sometimes inaccurate, or sometimes we wish to further narrow down our tweets to smaller locations.
# This script will filter the tweets to obtain only those which lie in the specified box.
# Enter values for SWlat,SWlon,NElat,NElon.
# SWlat is the latitude of the SouthWest coordinate of the box.
# SWlon is the longitude of the SouthWest coordinate of the box.
# NElat is the latitude of the NorthEast coordinate of the box.
# NElon is the longitude of the NorthEast coordinate of the box.
SWlat <- 33
SWlon <- -119
NElat <- 35
NElon <- -117

# The following defines the functions which will filter the tweets.

# This defines the function that will check whether the latitude values lie in the required region.
latCheck <- function(x) {
  lat <- (SWlat + NElat)/2
  lat_1 <- abs(SWlat - lat)
  a <- NULL
  n <- nrow(x)
  for (i in 1:n) {
    if(is.na(x$lat[i])){
      
      if(abs(x$place_lat[i] - lat) <= lat_1) {
        a <- c(a,TRUE)
      }
      else {
        a <- c(a,FALSE)
      }
    }
    else if (abs(x$lat[i] - lat) <= lat_1) {
      a <- c(a,TRUE)
    }
    
    else {
      a <- c(a,FALSE)
    }
  }
  return (a)
}

# This defines the function that will check whether the longitude values lie in the required region.
lonCheck <- function(x) {
  lon <- (SWlon + NElon)/2
  lon_1 <- abs(SWlon - lon)
  a <- NULL
  n <- nrow(x)
  for (i in 1:n) {
    if(is.na(x$lon[i])){
      
      if(abs(x$place_lon[i] - lon) <= lon_1) {
        a <- c(a,TRUE)
      }
      else {
        a <- c(a,FALSE)
      }
    }
    else if (abs(x$lon[i] - lon) <= lon_1) {
      a <- c(a,TRUE)
    }
    
    else {
      a <- c(a,FALSE)
    }
  }
  return (a)
}

# This funtion will actually filter the tweets using the above defined functions.
tweetFilter <- function (mydata) {
  t1 <- mydata[latCheck(mydata),]
  tweets <- t1[lonCheck(t1),]
  return (tweets)
}

# This will run the filter on the tweets PROVIDED they are stored under variable name tweets.df!
mytweets <- tweetFilter(tweets.df)