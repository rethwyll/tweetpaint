window.tweetpaint = window.tweetpaint || {}
tweetpaint.Models = tweetpaint.Models || {}

class tweetpaint.Models.Following 
  constructor: (obj)->
    @result = new tweetpaint.Models.Tweeters({ handles: @extractTweeters(obj.following), searchModel: $(this) })
          
  extractTweeters: (results) ->
    $.map(results, (o) -> return o['screen_name']).join(',')