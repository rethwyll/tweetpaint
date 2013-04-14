window.tweetpaint = window.tweetpaint || {}
tweetpaint.Views = tweetpaint.Views || {}

class tweetpaint.Views.Nudge
  constructor: (obj) ->
    @model = obj.model
    @el = obj.el
    @render()
    #@addEvents()

  addEvents: ->
    $(@model).on 'nudgecomplete', @render

  render: =>
    @el.removeClass('btn-warning').addClass('btn-success').text('Nudged!')
 