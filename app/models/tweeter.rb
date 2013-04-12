class Tweeter < ActiveRecord::Base
  attr_accessible :handle, :score
  has_and_belongs_to_many :handles, :tweeter_queues
end
