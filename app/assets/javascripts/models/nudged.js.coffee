window.tweetpaint = window.tweetpaint || {}
tweetpaint.Models = tweetpaint.Models || {}

class tweetpaint.Models.Nudged 
  constructor: (obj) ->
    tweeters = new tweetpaint.Models.Tweeters({ tweeters: @extractTweeters(obj.nudged), doLookups: false })
    tweets = new tweetpaint.Models.Tweets({ tweets: obj.nudged })
    @collateTweetersAndTweets tweeters, tweets

  collateTweetersAndTweets: (tweeters, tweets) ->
    @tweeters = $.map(tweeters.tweeters, (o,i) =>
      $.extend({}, o, tweets.tweets[i])
    ).sort((a,b) -> b.score-a.score)   
        
  extractTweeters: (results) ->
    $.map(results, (o) -> return o.user)