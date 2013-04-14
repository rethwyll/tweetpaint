window.tweetpaint = window.tweetpaint || {}
tweetpaint.Models = tweetpaint.Models || {}

class tweetpaint.Models.Tweets
  constructor: (obj) ->
    @tweets = @extractTweets(obj.tweets)

  extractTweets: (resp) ->
    $.map(resp, (o) => 
      returnObj =
        handle: o.user.screen_name
        text: o.text
        tweet_id: o.id_str )  