class Volunteer < ActiveRecord::Base
  include Permissions
  validates_presence_of :full_name, :email

  validates_length_of :preferences,
                      :maximum => 500,
                      :too_long =>"is too long. We're only taking {{count}} characters or less for now."
end
