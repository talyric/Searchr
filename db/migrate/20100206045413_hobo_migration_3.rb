class HoboMigration3 < ActiveRecord::Migration
  def self.up
    create_table :deployments do |t|
      t.string   :title
      t.text     :notes
      t.string   :status, :default => "Active"
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :deployments
  end
end
