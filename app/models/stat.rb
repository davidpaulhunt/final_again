class Stat < ActiveRecord::Base

  belongs_to :sport
  has_many :player_stats

  validates_presence_of :sport_id
  
end
