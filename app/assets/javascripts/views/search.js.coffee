tweetpaint.Views.Search = ->
  template: 
  model: {}
  el: $('#search-results')

  constructor = (obj) ->
    @model = obj.model
    @addEvents()

  addEvents = ->
    $(@model).on('searchcomplete', @render)

  render = ->
    $(@el).html(@template.render(@model.getSearchResults()))  
