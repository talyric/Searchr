class User < ActiveRecord::Base

  hobo_user_model # Don't put anything above this

  fields do
    name          :string, :required, :unique
    email_address :email_address, :login => true
    administrator :boolean, :default => false
    address       :string
    city          :string
    address_state      :string
    zip           :string
    primary_phone :string
    secondary_phone :string
    other_info_1  :string
    other_info_2  :string
    other_info_3  :string
    
    timestamps
  end
  
  has_many :capabilities, :through => :user_capabilities, :accessible => true
  has_many :user_capabilities, :dependent => :destroy

  # This gives admin rights to the first sign-up.
  # Just remove it if you don't want that
  before_create { |user| user.administrator = true if !Rails.env.test? && count == 0 }

  
  # --- Signup lifecycle --- #

  lifecycle do 

    state :active, :default => true

    create :signup, :available_to => "Guest",
           :params => [:name, :email_address, :password, :password_confirmation],
           :become => :active
             
    transition :request_password_reset, { :active => :active }, :new_key => true do
      UserMailer.deliver_forgot_password(self, lifecycle.key)
    end

    transition :reset_password, { :active => :active }, :available_to => :key_holder,
               :params => [ :password, :password_confirmation ]

  end
  

  # --- Permissions --- #

  def create_permitted?
    false
  end

  def update_permitted?
    #acting_user.administrator? || 
    #  (acting_user == self && only_changed?(:email_address, :crypted_password, 
    #                                        :current_password, :password, :password_confirmation))
    acting_user.administrator? || 
      (acting_user == self && only_changed?(:email_address, :crypted_password, :address, :city, :address_state, :zip, :primary_phone, :secondary_phone,
                                            :current_password, :password, :password_confirmation))
    # Note: crypted_password has attr_protected so although it is permitted to change, it cannot be changed
    # directly from a form submission.
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    acting_user.administrator? || acting_user == self || true
  end
  
#  def edit_permitted(attribute)
#    acting_user.administrator? || acting_user == self
#  end

end
