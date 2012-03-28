class Team < ActiveRecord::Base
  Colors = { "Green"  => "#00FF00",
             "Yellow" => "#FFFF00",
             "Red"    => "#FF0000",
             "Blue"   => "#0099FF",
             "White"  => "#FFFFFF",
             "Grey"   => "#999999",
             "Pink"   => "#9900CC"
          }

  validates_presence_of :name
  validates_inclusion_of :fake, :in => [true, false]
  validates_inclusion_of :color, :in => Colors.values
  has_many :season_entries
  has_many :race_entries
  attr_accessible :name, :fake, :color
end
