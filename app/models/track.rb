class Track < ActiveRecord::Base
  has_many :races, :dependent => :restrict_with_exception
  validates_presence_of :name, :number
end
