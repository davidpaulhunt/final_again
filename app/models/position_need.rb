class PositionNeed < ActiveRecord::Base

  belongs_to :school
  belongs_to :position
  has_many :notifications, as: :notifieable

  after_create :notify_players

  def notify_players
    NewPositionNeedJob.new.async.perform(position.players, self)
  end
  
end
