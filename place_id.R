  #This requires the httr and the jsonlite packages. First we setup the Authorization for our commands.
  #For this you need to enter your Consumer/API Key, Consumer/API Secret, Token and Token secret in the specified places below.
myapp = oauth_app("twitter", key="yourConsumerKeyHere",secret="yourConsumerSecretHere")
sig = sign_oauth1.0(myapp, token = "yourTokenHere", token_secret = "yourTokenSecretHere")
  #We can use the place_id variable to return all information about a known place.
  #In the following example the place id (df51dec6f4ee2b2c) is of Presidio,San Francisco.
  #sig contains my credentials and is used to authenticate the request.
Presidio = GET("https://api.twitter.com/1.1/geo/id/df51dec6f4ee2b2c.json", sig)
  #To bring it into an easily readable format - a dataframe - we use the
  #jsonlite package to restructure the data.
json1 = content(Presidio)
json2 = jsonlite::fromJSON(toJSON(json1))
head(json2)
