class ApplicationController < ActionController::Base
  protect_from_forgery

  Twitter.configure do |config|
    config.consumer_key = '2JWJdIOENnKHqdIJvMq4Q'
    config.consumer_secret = 'xX2EXk8tx47uecTA89rga74fP8EPd4C45KwTyDmDgc'
    config.oauth_token = '75133-IcL7ikmelT5PHhbKDxrtudpi6BMGG07kBczuz3SPI'
    config.oauth_token_secret = '0jBLu52sfoThPAQUsBVUH7Q8DypU20heAUl96bvMW0I'  
  end    
end
