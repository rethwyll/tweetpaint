class RemoveHandlesFromTweetersAndTweeterQueues < ActiveRecord::Migration
  def up
	  def change
	    delete_column :tweeters, :handle	  	
	    delete_column :tweeter_queues, :handle
	  end  	
  end

  def down
	  def change
	    add_column :tweeters, :handle	  	
	    add_column :tweeter_queues, :handle
	  end    	
  end
end
