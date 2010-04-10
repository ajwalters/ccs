class Sponsor < ActiveRecord::Base
  include Canable::Ables
  stampable
end
