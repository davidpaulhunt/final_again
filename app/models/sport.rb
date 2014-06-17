class Sport < ActiveRecord::Base

  has_many :positions
  # has_many :players, through: :positions

  validates_presence_of :name
  validates_uniqueness_of :name

end
