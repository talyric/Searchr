class AddedTeamMembers < ActiveRecord::Migration
  def self.up
    create_table :team_members do |t|
      t.string   :status
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :user_id
    end
    add_index :team_members, [:user_id]
  end

  def self.down
    drop_table :team_members
  end
end
