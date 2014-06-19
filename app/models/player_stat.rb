class PlayerStat < ActiveRecord::Base

  belongs_to :player
  belongs_to :stat

  validates_presence_of :player_id
  validates_presence_of :stat_id

end