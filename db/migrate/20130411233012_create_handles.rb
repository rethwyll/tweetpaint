class CreateHandles < ActiveRecord::Migration
  def change
    create_table :handles do |t|
      t.string :handle

      t.timestamps
    end
  end
end
