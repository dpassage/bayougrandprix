class Driver < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :player
end
