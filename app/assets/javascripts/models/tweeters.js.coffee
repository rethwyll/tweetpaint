window.tweetpaint = window.tweetpaint || {}
tweetpaint.Models = tweetpaint.Models || {}

class tweetpaint.Models.Tweeters
  INITIAL_SCORE = 0
  SCORE_TO_TAG =
    0: 'null'
    1: 'low'
    2: 'low-med'
    3: 'med'
    4: 'med-high'
    5: 'high'
  apiCalls =
    tweeter: 'https://api.twitter.com/1/users/lookup.json?screen_name='

  constructor: (obj) ->
    @doSearch({ 
      url: apiCalls.tweeter + obj.handles, 
      searchModel: obj.searchModel 
    })

  doSearch: (obj) ->
    $.get obj.url, (resp) =>
      @tweeters = $.map(resp, (o) => 
        score = @scoreTweeter(o)  
        tag = SCORE_TO_TAG[score]
        returnObj =
          handle: o.screen_name
          image_url: o.profile_image_url
          description: o.description
          score: score
          tag: tag      
          text: if o.hasOwnProperty('status') then o.status.text else ''
          followers_count: o.followers_count
          following: o.following )
        .sort((a,b) -> b.score-a.score)
      obj.searchModel.trigger('searchcomplete') 

  scoreTweeter: (tweeter) ->
    score = INITIAL_SCORE
    score += 2 if tweeter.followers_count > 10000  
    score += 1 if Math.floor(tweeter.followers_count/tweeter.friend_count) < 2
    score += 1 if !tweeter.profile_image_url.match(/default/g)
    #score -= 1 if TODO: date calculation
    score +=1 if tweeter.description
    score