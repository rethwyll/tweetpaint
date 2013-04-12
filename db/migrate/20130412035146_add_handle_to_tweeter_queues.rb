class AddHandleToTweeterQueues < ActiveRecord::Migration
  def change
    add_column :tweeter_queues, :handle, :string
  end
end
