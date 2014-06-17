class Position < ActiveRecord::Base

  belongs_to :sport
  has_and_belongs_to_many :players, join_table: :players_positions
  has_many :position_needs

  validates_presence_of :sport_id

end
