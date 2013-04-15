window.tweetpaint = window.tweetpaint || {}
tweetpaint.Models = tweetpaint.Models || {}

class tweetpaint.Models.Search 
  apiCalls =
    tweet: 'http://search.twitter.com/search.json?page=1&rpp=50&q='
    bio: 'https://api.twitter.com/1.1/users/search.json?q='

  constructor: (obj) ->
    @doSearch({
      url: apiCalls.tweet + encodeURI(obj.q)
    })

  doSearch: (obj) ->
    $.ajax 
      url: obj.url
      dataType: 'jsonp'
      success: (resp) =>   
        @result = new tweetpaint.Models.Tweeters({ handles: @extractTweeters(resp.results), doLookups: true, complete: { model: $(this), name: 'searchcomplete'} })


  extractTweeters: (results) ->
    $.map(results, (o) -> return o['from_user']).join(',')
