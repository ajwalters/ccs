class Speaker < ActiveRecord::Base
  include Canable::Ables
  stampable
end
