class AddedUserCapabilities < ActiveRecord::Migration
  def self.up
    create_table :capabilities do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :user_capabilities do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :user_id
      t.integer  :capability_id
    end
    add_index :user_capabilities, [:user_id]
    add_index :user_capabilities, [:capability_id]
  end

  def self.down
    drop_table :capabilities
    drop_table :user_capabilities
  end
end
