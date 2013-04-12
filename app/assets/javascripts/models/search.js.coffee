tweetpaint.Models.Search = ->
  q: {}
  type: {}
  url: {}
  results: {}

  apiCalls =
    tweet: 'http://search.twitter.com/search.json?q='
    bio: 'https://api.twitter.com/1.1/users/search.json?q='

  constructor = (obj) ->
    @q = obj.q
    @type = obj.type
    @url = this.apiCalls['type'] + @type
    this.doSearch

  doSearch = ->
    $.get @url, (resp) =>
      @results = resp
      $(this).trigger('searchcomplete')

  getSearchResults = ->
    @results