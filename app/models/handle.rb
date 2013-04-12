class Handle < ActiveRecord::Base
  attr_accessible :handle
  has_and_belongs_to_many :tweeters
  has_many :tweeter_queues

  before_save :default_values 

  def default_values
	@nudged_queue = TweeterQueue.new(:name => "Nudged")
    @follow_queue = TweeterQueue.new(:name => "Follow")
    @unfollow_queue = TweeterQueue.new(:name => "Unfollow")
  end
end
