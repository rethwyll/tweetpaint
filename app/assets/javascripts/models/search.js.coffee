window.tweetpaint = window.tweetpaint || {}
tweetpaint.Models = tweetpaint.Models || {}

class tweetpaint.Models.Search 
  
  apiCalls =
    tweet: 'http://search.twitter.com/search.json?q='
    bio: 'https://api.twitter.com/1.1/users/search.json?q='

  twitterConfig = 
    consumer_key: '4TR53HN3sCVyLC11bmgSnA'
    consumer_secret: 'OGbtRxRbX4OlKUmya7fiFnbhbZHKvtd6bs4O3gFBQ'
    token: '1061151948-TghFUqPEuad1gkH9Q6Ea7zdkADLjdUbMfDfEUZC'
    secret: '7VB3X5h1Rd2fSWe4sFAjIdd8WtuzkgpE0tYTuG6pJCA'  

  constructor: (obj) ->
    @q = obj.q
    @type = obj.type
    @url = 'https://api.twitter.com/1.1/search/tweets.json?q=' + encodeURI(@q) 
    @authenticate()
    @doSearch()

  authenticate: ->
    Twitter.configure do |config|
      config.consumer_key = twitterConfig.consumer_key
      config.consumer_secret = twitterConfig.consumer_secret
      config.oauth_token = twitterConfig.token
      config.oauth_token_secret = twitterConfig.secret
    end    

  doSearch: ->
    $.get @url, (resp) =>
      @results = resp
      $(this).trigger('searchcomplete')

  getSearchResults: ->
    @results