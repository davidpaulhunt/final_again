class Coach < User

  has_many :position_needs, :limit => 5, dependent: :destroy
  has_one :coaching_position
  has_one :school, through: :coaching_position

end