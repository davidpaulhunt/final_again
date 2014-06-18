class VideosController < ApplicationController

  include Rails.application.routes.url_helpers

  def show
    @video = Video.find(params[:id])
    @original_video = @video.panda_video
    @h264e = @original_video.encodings["h264"]
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.create!(video_params)
    redirect_to :action => :show, :id => @video.id
  end

  private

  def video_params
    params.require(:video).permit!
  end

end