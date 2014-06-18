class Video < ActiveRecord::Base

  belongs_to :player
  
  validates_presence_of :panda_video_id

  def panda_video
    @panda_video ||= Panda::Video.find(panda_video_id)
  end

end