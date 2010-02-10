class ChangedNameOfNameColumnToCapabilityName < ActiveRecord::Migration
  def self.up
    rename_column :capabilities, :name, :capability_name
  end

  def self.down
    rename_column :capabilities, :capability_name, :name
  end
end
