class Tweeter < ActiveRecord::Base
  attr_accessible :score
  has_and_belongs_to_many :handles 
  has_and_belongs_to_many :tweeter_queues
end
