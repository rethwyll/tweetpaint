window.tweetpaint = window.tweetpaint || {}
tweetpaint.Models = tweetpaint.Models || {}

class tweetpaint.Models.Nudge 
  apiCalls =
    tweets: 'https://api.twitter.com/1.1/statuses/user_timeline.json?count=20&screen_name='
    nudge: 'https://api.twitter.com/1.1/favorites/create.json?id='

  constructor: (obj) ->
    #@doSearch({
    #  url: apiCalls.tweets + encodeURI(obj.handle)
    #})

  doSearch: (obj) ->
    $.get obj.url, (resp) =>   
      tweetId = @extractRandomTweetId(resp.results)
      @favoriteTweet(tweetId)
          
  extractRandomTweetId: (results) ->
    $.map(results, (o) -> return o['id'])[Math.floor(Math.random()*items.length)]

  favoriteTweet: (id) =>
    url = apiCalls.nudge + id
    $.post url, (resp) =>   
      @model.trigger('nudgecomplete')