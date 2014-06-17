class FavoriteSchoolsController < ApplicationController

  def create
    @favorite_school = FavoriteSchool.new(favorite_school_params)
    if @favorite_school.save
      redirect_to school_path(@favorite_school.school.id)
    else
      redirect_to school_path(@favorite_school.school.id), notice: "Oops :("
    end
  end

  private

  def favorite_school_params
    params.require(:favorite_school).permit(:player_id, :school_id)
  end

end