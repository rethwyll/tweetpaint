#= require jquery
#= require ../../app/assets/javascripts/handles.js

#= require_tree .

describe "initHandle", ->
  handle = 'rethwyll'

  beforeEach ->
  
  it "exists", ->
    expect(window.tweetpaint.Handle).toBeDefined()