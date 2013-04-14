window.tweetpaint = window.tweetpaint || {}
tweetpaint.Models = tweetpaint.Models || {}

class tweetpaint.Models.Nudged 
  constructor: (obj)->
    @tweeters = new tweetpaint.Models.Tweeters({ handles: @extractTweeters(obj.nudged), tweets: @extractTweets(obj.nudged), doLookups: true })
    $(this).trigger('searchcomplete')
          
  extractTweeters: (results) ->
    $.map(results, (o) -> return $.parseJSON(o).user.screen_name).join(',')