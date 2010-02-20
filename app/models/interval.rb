class Interval < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    start_time :datetime
    end_time   :datetime
    timestamps
  end

  belongs_to :user

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
