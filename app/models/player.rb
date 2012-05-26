class Player < ActiveRecord::Base
  validates_presence_of :name
  has_many :drivers, :dependent => :restrict
  attr_accessible :name, :email
end
