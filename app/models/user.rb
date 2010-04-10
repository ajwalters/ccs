class User < ActiveRecord::Base
  include Clearance::User
  include Canable::Cans
  model_stamper
  stampable

  attr_accessible :email, :password, :password_confirmation
end
