  #We can use the unique screen_name of a user (the @name) to locate
  #and retrieve their profile details and recent tweets.
  #In the following example the users are @twitterapi and @twitter.
  #sig contains my credentials and is used to authenticate the request.
lookupuser = GET("https://api.twitter.com/1.1/users/lookup.json?screen_name=twitterapi,twitter", sig)
  #To bring it into an easily readable format - a dataframe - we use the
  #jsonlite package to restructure the data.
json1 = content(lookupuser)
json2 = jsonlite::fromJSON(toJSON(json1))
head(json2)