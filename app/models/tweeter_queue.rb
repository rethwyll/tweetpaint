class TweeterQueue < ActiveRecord::Base
  attr_accessible :name
  belongs_to :handle
  has_and_belongs_to_many :tweeters
end
