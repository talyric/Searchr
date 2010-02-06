class UserCapability < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
   cert_expiration :date
   timestamps
  end

  belongs_to :user
  belongs_to :capability

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
