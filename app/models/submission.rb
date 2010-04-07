class Submission < ActiveRecord::Base
  include Permissions
  validates_presence_of :full_name, :biography, :email, :title, :description

  validates_length_of :biography, :description,
    :maximum =>500,
    :too_long =>"is too long. We're only taking {{count}} characters or less for now."
end
