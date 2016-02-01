  #We can use the geocode variable in the Search API to retrieve Tweets of users within a particular area.
  #In the following example the geocode value (latitude,longitude,radius) is in San Francisco,USA and the
  #command looks for all tweets in that area.
  #sig contains my credentials and is used to authenticate the request.
  #result_type determines whether you want popular tweets or recent tweets or both. 
SFtweets = GET("https://api.twitter.com/1.1/search/tweets.json?q=&geocode=37.781157,-122.398720,1mi&result_type=mixed&count=4", sig)
  #To bring it into an easily readable format - a dataframe - we use the
  #jsonlite package to restructure the data.
json1 = content(SFtweets)
json2 = jsonlite::fromJSON(toJSON(json1))
head(json2)