window.tweetpaint = window.tweetpaint || {}
tweetpaint.Models = tweetpaint.Models || {}

class tweetpaint.Models.Following 
  apiCalls =
    following: 'https://api.twitter.com/1.1/friends/list.json?cursor=-1&screen_name=rethwyll'

  constructor: ->
    @url = apiCalls.following
    @doSearch()

  doSearch: ->
    $.get @url, (resp) =>   
      @result = new tweetpaint.Models.Tweeters({ handles: @extractTweeters(resp.results), searchModel: $(this) })
          
  extractTweeters: (results) ->
    $.map(results, (o) -> return o['from_user']).join(',')