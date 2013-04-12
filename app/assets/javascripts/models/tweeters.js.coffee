window.tweetpaint = window.tweetpaint || {}
tweetpaint.Models = tweetpaint.Models || {}

class tweetpaint.Models.Tweeters
  apiCalls =
    tweeter: 'http://api.twitter.com/1/users/lookup?q='

  constructor: (obj) ->
    @handle = obj.handle
    @url = apiCalls.tweeter + @handle
    @score = 5
    @doSearch()

  calculateScore: (tweeter) ->
    @score -= 1 if Math.floor(tweeter.followers_count/tweeter.friend_count) > 2
    @score -= 1 if tweeter.profile_image_url.match(/default/g)
    #@score -= 1 if TODO: date calculation
    @score -1 if !tweeter.description

  doSearch: ->
    $.get @url, (resp) =>
      @tweeter = resp[0]
      @tweeter.score = @calculateScore(@tweeter)    
      $(this).trigger('searchcomplete') 