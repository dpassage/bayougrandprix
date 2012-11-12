class Player < ActiveRecord::Base
  validates_presence_of :name
  has_many :drivers, :dependent => :restrict_with_exception
end
