window.tweetpaint = window.tweetpaint || {}
tweetpaint.Views = tweetpaint.Views || {}

class tweetpaint.Views.Search
  constructor: (obj) ->
    @model = obj.model
    @template = 'hello'
    @el = $('#search-results')    
    @addEvents()

  addEvents: ->
    $(@model).on('searchcomplete', @render)

  render: ->
    #$(@el).html(@template.render(@model.getSearchResults()))  
    $(@el).html('hi') 