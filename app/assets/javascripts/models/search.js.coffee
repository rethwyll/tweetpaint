window.tweetpaint = window.tweetpaint || {}
tweetpaint.Models = tweetpaint.Models || {}

class tweetpaint.Models.Search 
  
  apiCalls =
    tweet: 'http://search.twitter.com/search.json?q='
    bio: 'https://api.twitter.com/1.1/users/search.json?q='

  constructor: (obj) ->
    @q = obj.q
    @type = obj.type
    @url = 'http://search.twitter.com/search.json?q=' + encodeURI(@q) 
    @doSearch()


  doSearch: ->
    $.get @url, (resp) =>
      @tweeters = @extractTweeters(resp.results)
      $(this).trigger('searchcomplete')

  extractTweeters: (results) ->
    tweeters = []
    for result in results
      tweeter = 
        handle: result.from_user
        image_url: result.profile_image_url
        text: result.text
      tweeters.push(tweeter)
    tweeters
