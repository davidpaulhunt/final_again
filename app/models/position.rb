class Position < ActiveRecord::Base

  has_and_belongs_to_many :players, join_table: :players_positions
  has_many :position_needs

  validates_presence_of :position_id
  validates_presence_of :player_id

end
