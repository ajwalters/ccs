class User < ActiveRecord::Base
  include Clearance::User

  attr_accessible :email, :password, :password_confirmation
end
