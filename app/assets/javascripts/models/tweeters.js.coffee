window.tweetpaint = window.tweetpaint || {}
tweetpaint.Models = tweetpaint.Models || {}

class tweetpaint.Models.Tweeters
  RECENCY_PERIOD = 14 * 24 * 60 * 60 * 1000 # 14 days
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
    if obj.doLookups  
      @doSearch({ 
        url: apiCalls.tweeter + obj.handles, 
        searchModel: obj.searchModel 
      })  
    else 
      @tweeters = @extractTweeterData(obj.tweeters)
      obj.searchModel.trigger('searchcomplete') if obj.hasOwnProperty 'searchModel'

  doSearch: (obj) ->
    $.get obj.url, (resp) =>
      @tweeters = @extractTweeterData(resp)
      obj.searchModel.trigger('searchcomplete') if obj.hasOwnProperty 'searchModel'

  extractTweeterData: (resp) ->
    $.map(resp, (o) => 
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


  isRecent: (tweet) ->
    tweetDate = new Date(tweet.created_at)
    now = new Date()
    if now - tweetDate < RECENCY_PERIOD then true else false

  scoreTweeter: (tweeter) ->
    score = INITIAL_SCORE
    score += 2 if tweeter.followers_count > 10000  
    score += 1 if Math.floor(tweeter.followers_count/tweeter.friend_count) < 2
    score += 1 if !tweeter.profile_image_url.match(/default/g)
    if tweeter.hasOwnProperty('status')
      score += 1 if @isRecent(tweeter.status)
    score +=1 if tweeter.description
    score