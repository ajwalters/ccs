class Agenda < ActiveRecord::Base
  include Canable::Ables
  stampable
end
