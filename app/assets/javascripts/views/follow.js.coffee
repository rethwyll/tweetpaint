window.tweetpaint = window.tweetpaint || {}
tweetpaint.Views = tweetpaint.Views || {}

class tweetpaint.Views.Follow
  constructor: (obj) ->
    @model = obj.model
    @template = $('#tQueue').html() #TODO: Mustache.compile
    @el = '#follow-results'   
    @addEvents()

  addEvents: ->
    $(@model).on 'followcomplete', @render

  render: =>
    @model.result.tweeters.sort((a,b) -> b.score-a.score)   
    $(@el).html(Mustache.render(@template, @model.result))
 