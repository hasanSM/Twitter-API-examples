  #We can use the unique user_id of a user to locate and retrieve their profile details and tweets.
  #In the following example the user id is 6253282 and it belongs to @twitterapi.
  #We look to see a timeline of the most recent tweets by the Twitter API account.
  #sig contains my credentials and is used to authenticate the request.
  #Count=5 tells the API how many results to return.
usertimeline = GET("https://api.twitter.com/1.1/statuses/user_timeline.json?user_id=6253282&count=5", sig)
  #To bring it into an easily readable format - a dataframe - we use the
  #jsonlite package to restructure the data.
json1 = content(usertimeline)
json2 = jsonlite::fromJSON(toJSON(json1))
head(json2)