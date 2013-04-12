class ApplicationController < ActionController::Base
  protect_from_forgery

  Twitter.configure do |config|
    config.consumer_key = '4TR53HN3sCVyLC11bmgSnA'
    config.consumer_secret = 'OGbtRxRbX4OlKUmya7fiFnbhbZHKvtd6bs4O3gFBQ'
    config.oauth_token = '1061151948-TghFUqPEuad1gkH9Q6Ea7zdkADLjdUbMfDfEUZC'
    config.oauth_token_secret = '7VB3X5h1Rd2fSWe4sFAjIdd8WtuzkgpE0tYTuG6pJCA'  
  end    
end
