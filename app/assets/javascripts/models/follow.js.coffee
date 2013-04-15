window.tweetpaint = window.tweetpaint || {}
tweetpaint.Models = tweetpaint.Models || {}

class tweetpaint.Models.Follow
  constructor: (obj)->
    @result = new tweetpaint.Models.Tweeters({ handles: obj.follow, doLookups: true, complete: { model: $(this), name: 'followcomplete'} })