  #This requires the httr and the jsonlite packages. First we setup the Authorization for our commands.
  #For this you need to enter your Consumer/API Key, Consumer/API Secret, Token and Token secret in the specified places below.
myapp = oauth_app("twitter", key="yourConsumerKeyHere",secret="yourConsumerSecretHere")
sig = sign_oauth1.0(myapp, token = "yourTokenHere", token_secret = "yourTokenSecretHere")
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
