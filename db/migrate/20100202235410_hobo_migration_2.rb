class HoboMigration2 < ActiveRecord::Migration
  def self.up
    rename_column :user_capabilities, :expiration, :cert_expiration
  end

  def self.down
    rename_column :user_capabilities, :cert_expiration, :expiration
  end
end
