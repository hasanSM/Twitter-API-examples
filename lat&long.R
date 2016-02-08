  #This requires the httr and the jsonlite packages. First we setup the Authorization for our commands.
  #For this you need to enter your Consumer/API Key, Consumer/API Secret, Token and Token secret in the specified places below.
myapp = oauth_app("twitter", key="yourConsumerKeyHere",secret="yourConsumerSecretHere")
sig = sign_oauth1.0(myapp, token = "yourTokenHere", token_secret = "yourTokenSecretHere")
  #We can use the lat and long variables to locate and retrieve place ids.
  #In the following example the latitude & longitude values are of San Francisco,CA,USA.
  #sig contains my credentials and is used to authenticate the request.
places = GET("https://api.twitter.com/1.1/geo/reverse_geocode.json?lat=37.76893497&long=-122.42284884", sig)
  #To bring it into an easily readable format - a dataframe - we use the
  #jsonlite package to restructure the data.
json1 = content(places)
json2 = jsonlite::fromJSON(toJSON(json1))
head(json2)
