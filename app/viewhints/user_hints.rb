class UserHints < Hobo::ViewHints

  field_names :address_state => "State"
  children :capabilities, :unavailable_dates, :intervals

end

