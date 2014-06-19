class Position < ActiveRecord::Base

  has_and_belongs_to_many :players, join_table: :players_positions
  has_many :position_needs
  belongs_to :sport

  validates_presence_of :sport_id

end
