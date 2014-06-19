class PlayerStatsController < ApplicationController

  before_action :set_player_stat, only: [:show, :update, :edit, :destroy]

  def index
  end

  def new
    @player_stat = PlayerStat.new
  end

  def create
    @player_stat = PlayerStat.new(player_stat_params)
    debugger
    if @player_stat.save
      redirect_to root_path
    else
      render :back
    end
  end

  def update
    if @player_stat.update_attributes(player_stat_params)
      render plain: 1
    else
      render plain: 0
    end
  end

  private

  def player_stat_params
    params.require(:player_stat).permit(:stat_id, :value, :player_id)
  end

  def set_player_stat
    @player_stat = PlayerStat.find(params[:id])
  end

end