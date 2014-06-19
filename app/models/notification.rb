class Notification < ActiveRecord::Base

  include Workflow

  workflow do
    state :new do
      event :review, transitions_to: :reviewed
    end
    state :reviewed
  end

  belongs_to :account
  belongs_to :notifieable, polymorphic: true

  after_create :new_notification

  attr_accessor :mark_reviewed
  scope :active, -> { with_new_state }

  def new_notification
  end

  def load_notifieable
    id = self.notifieable_id
    resource = self.notifieable_type.constantize
    resource.find(id)
  end

  def active
    notifications.with_new_state
  end

  def self.mark_reviewed(type, notifieable_id, current_user_id)
    @user = Account.find(current_user_id)
    @notes = @user.notifications.active
    @notes.each do |note|
      case type
      when "school"
        if note.notifieable.school.id == notifieable_id.to_i
          note.review!
          note.save
        end
      when "player"
        if note.notifieable.player.id == notifieable_id.to_i
          note.review!
          note.save
        end
      end
    end
  end

  

end
