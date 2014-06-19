class School < ActiveRecord::Base

  has_one :account, as: :accountable
  has_many :position_needs
  has_many :favorite_schools

  accepts_nested_attributes_for :account

end
