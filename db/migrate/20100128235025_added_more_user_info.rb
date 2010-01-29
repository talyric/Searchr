class AddedMoreUserInfo < ActiveRecord::Migration
  def self.up
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :zip, :string
    add_column :users, :primary_phone, :string
    add_column :users, :secondary_phone, :string
    add_column :users, :other_info_1, :string
    add_column :users, :other_info_2, :string
    add_column :users, :other_info_3, :string
  end

  def self.down
    remove_column :users, :address
    remove_column :users, :city
    remove_column :users, :zip
    remove_column :users, :primary_phone
    remove_column :users, :secondary_phone
    remove_column :users, :other_info_1
    remove_column :users, :other_info_2
    remove_column :users, :other_info_3
  end
end
