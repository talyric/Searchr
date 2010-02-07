class AddedBelongsToForDeployment < ActiveRecord::Migration
  def self.up
    add_column :team_members, :deployment_id, :integer

    add_index :team_members, [:deployment_id]
  end

  def self.down
    remove_column :team_members, :deployment_id

    remove_index :team_members, :name => :index_team_members_on_deployment_id rescue ActiveRecord::StatementInvalid
  end
end
