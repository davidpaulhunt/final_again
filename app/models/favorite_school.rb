class FavoriteSchool < ActiveRecord::Base

  belongs_to :player
  belongs_to :school
  
end
