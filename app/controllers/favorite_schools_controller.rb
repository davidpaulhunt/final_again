class FavoriteSchoolsController < ApplicationController

  def create
    player = Player.find(params[:favorite_school][:player_id])
    if !player.favorite_schools.where(school_id: params[:favorite_school][:school_id]).present?
      @favorite_school = FavoriteSchool.new(favorite_school_params)
      if @favorite_school.save
        redirect_to school_path(@favorite_school.school.id)
      else
        redirect_to school_path(@favorite_school.school.id), notice: "Oops :("
      end
    else
      redirect_to :back
    end
  end

  private

  def favorite_school_params
    params.require(:favorite_school).permit(:player_id, :school_id)
  end

end