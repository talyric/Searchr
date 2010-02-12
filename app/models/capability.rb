class Capability < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    capability_name :string, :name => true
    timestamps
  end
  
  has_many :users, :through => :user_capabilities
  has_many :user_capabilities, :dependent => :destroy

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
