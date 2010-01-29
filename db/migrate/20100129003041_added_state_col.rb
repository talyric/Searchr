class AddedStateCol < ActiveRecord::Migration
  def self.up
    add_column :users, :address_state, :string
  end

  def self.down
    remove_column :users, :address_state
  end
end
