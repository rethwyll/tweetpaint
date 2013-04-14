window.tweetpaint = window.tweetpaint || {}
tweetpaint.Views = tweetpaint.Views || {}

class tweetpaint.Views.Nudged
  constructor: (obj) ->
    @model = obj.model
    @template = $('#tNudged').html() #TODO: Mustache.compile
    @el = '#nudged-results'   
    @render()

  render: =>
    $(@el).html(Mustache.render(@template, @model))
 