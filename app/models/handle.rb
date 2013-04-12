class Handle < ActiveRecord::Base
  attr_accessible :handle
  has_and_belongs_to_many :tweeters
  has_many :tweeter_queues
end
