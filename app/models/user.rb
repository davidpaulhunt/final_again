class User < ActiveRecord::Base

  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_confirmation_of :password
  validates :terms, acceptance: true
  validates :type, inclusion: ["Player", "Coach"]

  mount_uploader :avatar, UserAvatarUploader

  def player?
    type == "Player"
  end

  def coach?
    type == "Coach"
  end

  def update_positions(ids)
    ids.each do |id|
      positions << Position.find(id.to_i) unless positions.include?(Position.find(id.to_i))
    end
  end

end
