class FavoriteSchool < ActiveRecord::Base

  belongs_to :player
  belongs_to :school

  has_many :notifications, as: :notifieable

  after_create :notify_school

  def notify_school
    NewFavoriteSchoolJob.new.async.perform(school.coaches, self)
  end
  
end
