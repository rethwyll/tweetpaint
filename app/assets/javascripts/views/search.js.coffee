window.tweetpaint = window.tweetpaint || {}
tweetpaint.Views = tweetpaint.Views || {}

class tweetpaint.Views.Search
  constructor: (obj) ->
    @model = obj.model
    @template = $('#tTweeters').html() #TODO: Mustache.compile
    @el = '#search-results'   
    @addEvents()

  addEvents: ->
    $(@model).on('searchcomplete', @render)

  render: =>
    $(@el).html(Mustache.render(@template, @model))