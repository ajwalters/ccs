class Configuration < ActiveRecord::Base
  include Canable::Ables
  stampable
end
