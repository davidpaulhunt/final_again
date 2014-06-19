class Account < ActiveRecord::Base

  has_secure_password

  has_many :notifications
  belongs_to :accountable, polymorphic: true

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_confirmation_of :password
  validates :terms, acceptance: true

  mount_uploader :avatar, AccountAvatarUploader

  def active?
    active
  end

end
