  #This requires the httr and the jsonlite packages. First we setup the Authorization for our commands.
  #For this you need to enter you Consumer/API Key, Consumer/API Secret, Token and Token secret in the specified places below.
myapp = oauth_app("twitter", key="yourConsumerKeyHere",secret="yourConsumerSecretHere")
sig = sign_oauth1.0(myapp, token = "yourTokenHere", token_secret = "yourTokenSecretHere")
  #We can use the WOEID variable to retrieve trends from a particular area.
  #In the following example the WOEID value 1 is used to find trends worldwide.
  #sig contains my credentials and is used to authenticate the request.
wwtrends = GET("https://api.twitter.com/1.1/trends/place.json?id=1", sig)
  #To bring it into an easily readable format - a dataframe - we use the
  #jsonlite package to restructure the data.
json1 = content(wwtrends)
json2 = jsonlite::fromJSON(toJSON(json1))
head(json2)
