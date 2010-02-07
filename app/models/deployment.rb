class Deployment < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    title :string
    notes :text
    status enum_string(:Active, :Inactive), :default => "Active"
    timestamps
  end

  has_many :users, :through => :team_members
  has_many :team_members, :accessible => true, :dependent => :destroy

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
