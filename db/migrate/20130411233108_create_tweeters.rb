class CreateTweeters < ActiveRecord::Migration
  def change
    create_table :tweeters do |t|
      t.string :handle
      t.integer :score

      t.timestamps
    end
  end
end
