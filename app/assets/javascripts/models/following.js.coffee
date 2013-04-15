window.tweetpaint = window.tweetpaint || {}
tweetpaint.Models = tweetpaint.Models || {}

class tweetpaint.Models.Following 
  constructor: (obj)->
    @result = new tweetpaint.Models.Tweeters({ handles: @extractTweeters(obj.following), doLookups: true, complete: { model: $(this), name: 'followingcomplete'} })
          
  extractTweeters: (results) ->
    unfollow = sessionStorage.getItem('unfollowQueue').split(',')
    $.map(results, (o) -> 
        return o.screen_name if $.inArray(o.screen_name, unfollow) == -1
    ).join(',')