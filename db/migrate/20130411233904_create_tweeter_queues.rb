class CreateTweeterQueues < ActiveRecord::Migration
  def change
    create_table :tweeter_queues do |t|
      t.string :name

      t.timestamps
    end
  end
end
