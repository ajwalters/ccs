class Slot < ActiveRecord::Base
  include Canable::Ables
  stampable
end
