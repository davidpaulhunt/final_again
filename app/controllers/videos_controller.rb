class VideosController < ApplicationController

  include Rails.application.routes.url_helpers

  def show
    @video = Video.find(params[:id])
    @original_video = @video.panda_video
    @h264e = @original_video.encodings['h264']
  end

  def simple
    @video = Video.new
    render 'simple'
  end

  def advanced
    render 'advanced'
  end

  def create
    @video = Video.create!(video_params)
    redirect_to root_path
  end

  def postprocess
    video_params = JSON.parse(params["upload_response"])
    @video = Video.new(:panda_video_id => video_params["id"], :title => "Title-to-be-edited-later")

    if @video.save
      render :json => {:play_url => url_for(@video), :id => @video_id}
    end
  end

  private

  def video_params
    params.require(:video).permit(:title, :panda_video_id, :player_id)
  end

end