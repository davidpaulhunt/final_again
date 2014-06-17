class School < ActiveRecord::Base

  has_many :coaching_positions
  has_many :coaches, through: :coaching_positions
  has_many :position_needs, through: :coaches
  has_many :favorite_schools

end
