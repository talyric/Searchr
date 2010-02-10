class UserCapability < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
   cert_expiration :date
   timestamps
  end


  belongs_to :user
  belongs_to :capability


  def the_name
    Capability.find(capability_id).capability_name
  end
  
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
