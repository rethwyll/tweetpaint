window.tweetpaint = window.tweetpaint || {}
tweetpaint.Views = tweetpaint.Views || {}

class tweetpaint.Views.Following
  constructor: (obj) ->
    @model = obj.model
    @template = $('#tFollowing').html() #TODO: Mustache.compile
    @el = '#following-results'   
    @addEvents()

  addEvents: ->
    $(@model).on 'followingcomplete', @render

  render: =>
    @model.result.tweeters.sort((a,b) -> b.score-a.score)   
    $(@el).html(Mustache.render(@template, @model.result))
 