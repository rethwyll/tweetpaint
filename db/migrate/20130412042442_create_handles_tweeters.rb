class CreateHandlesTweeters < ActiveRecord::Migration
  def up
    create_table :handles_tweeters do |t|
      t.integer :handle_id
      t.integer :tweeter_id

      t.timestamps
    end  	
  end

  def down
    drop_table :handles_tweeters
  end
end
