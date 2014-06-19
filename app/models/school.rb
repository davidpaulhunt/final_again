class School < ActiveRecord::Base

  has_one :account, as: :accountable
  has_many :position_needs
  has_many :favorite_schools
  has_many :positions, through: :position_needs

  accepts_nested_attributes_for :account

  def favorited(player)
    @current = []
    favorite_schools.each do |fav|
      @current.push(fav.player)
    end
    @current.include?(player)
  end

end
