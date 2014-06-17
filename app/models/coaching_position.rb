class CoachingPosition < ActiveRecord::Base

  belongs_to :coach
  belongs_to :school

end