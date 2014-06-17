class SportsController < ApplicationController

  def create
    @sport = Sport.new(sport_params)
    @sport.save
  end

  def show
  end

  private

  def sport_params
    params.require(:sport).permit!
  end
  
end
