#We can use the query variable to search Twitter for any set of characters or digits and return the results.
#Note that this requires the URI to be properly percent encoded.
#In the following example the command looks for recent tweets that contain "#superbowl".
#sig contains my credentials and is used to authenticate the request.
#result_type determines whether you want popular tweets or recent tweets or both. 
Superbowl = GET("https://api.twitter.com/1.1/search/tweets.json?q=%23superbowl&result_type=recent", sig)
#To bring it into an easily readable format - a dataframe - we use the
#jsonlite package to restructure the data.
json1 = content(Superbowl)
json2 = jsonlite::fromJSON(toJSON(json1))
head(json2)