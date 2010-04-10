class Session < ActiveRecord::Base
  include Canable::Ables
  stampable
end
