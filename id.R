  #This requires the httr and the jsonlite packages. First we setup the Authorization for our commands.
  #For this you need to enter your Consumer/API Key, Consumer/API Secret, Token and Token secret in the specified places below.
myapp = oauth_app("twitter", key="yourConsumerKeyHere",secret="yourConsumerSecretHere")
sig = sign_oauth1.0(myapp, token = "yourTokenHere", token_secret = "yourTokenSecretHere")
  #We can use the unique id of a Tweet to locate and retrieve it.
  #In the following example the id of the Tweet is 692765099879063552
  #and we look to see how many Retweets it has and the details of who Retweeted it.
  #sig contains my credentials and is used to authenticate the request.
retweets = GET("https://api.twitter.com/1.1/statuses/retweets/692765099879063552.json", sig)
  #To bring it into an easily readable format - a dataframe - we use the
  #jsonlite package to restructure the data.
json1 = content(retweets)
json2 = jsonlite::fromJSON(toJSON(json1))
head(json2)
