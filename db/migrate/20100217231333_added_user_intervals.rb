class AddedUserIntervals < ActiveRecord::Migration
  def self.up
    create_table :intervals do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :user_id
    end
    add_index :intervals, [:user_id]
  end

  def self.down
    drop_table :intervals
  end
end
