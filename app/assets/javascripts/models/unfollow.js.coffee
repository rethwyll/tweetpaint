window.tweetpaint = window.tweetpaint || {}
tweetpaint.Models = tweetpaint.Models || {}

class tweetpaint.Models.Unfollow
  constructor: (obj)->
    @result = new tweetpaint.Models.Tweeters({ handles: obj.unfollow, doLookups: true, complete: { model: $(this), name: 'unfollowcomplete'} })