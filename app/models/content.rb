class Content < ActiveRecord::Base
  include Canable::Ables
  stampable

  validates_presence_of :name
end
