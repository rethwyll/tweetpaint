window.tweetpaint = window.tweetpaint || {}
tweetpaint.Models = tweetpaint.Models || {}

class tweetpaint.Models.Search 
  apiCalls =
    tweet: 'http://search.twitter.com/search.json?q='
    bio: 'https://api.twitter.com/1.1/users/search.json?q='

  constructor: (obj) ->
    @q = obj.q
    @type = obj.type
    @url = apiCalls.tweet + encodeURI(@q) 
    @doSearch()

  doSearch: ->
    $.get @url, (resp) =>
      @tweeters = @extractTweeters(resp.results)

  extractTweeters: (results) ->
    tweeters = []
    for result in results
      # TODO: mass lookup on tweeters, not one at a time
      tweeter = new tweetpaint.Models.Tweeters(result.from_user)
      tweeters.push(tweeter)
    tweeters
