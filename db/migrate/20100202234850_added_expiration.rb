class AddedExpiration < ActiveRecord::Migration
  def self.up
    add_column :user_capabilities, :expiration, :date
  end

  def self.down
    remove_column :user_capabilities, :expiration
  end
end
