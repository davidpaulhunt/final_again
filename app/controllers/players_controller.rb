class PlayersController < ApplicationController

  skip_filter :ensure_logged_in, only: [:new, :create]
  before_action :set_player, only: [:edit, :show, :update]

  def index
    @players = Player.all
  end

  def new
    @player = Player.new
    @account = @player.build_account
  end

  def create
    @player = Player.create(player_params)
    @account = @player.account
    if @player.save
      if params[:positions]
        @player.update_positions(params[:positions])
      end
      redirect_to login_path
    else
      render :new
    end
  end

  def edit
  end

  def show
    Notification.mark_reviewed("player", params[:id], current_user.id)
  end

  def update
    @player.account.update_attributes(player_params[:account_attributes])
    if @player.update_attributes(player_params)
      if params[:positions]
        @player.update_positions(params[:positions])
      end
      redirect_to root_path
    else
      render :edit
    end
  end

  def position_search
    position = params[:position]
    @players = Player.joins(:positions).where("positions.name = ?", position)
    render :index
  end

  def location_search
    location = params[:location]
    @players = Player.joins(:account).where("accounts.location = ?", location)
    render :index
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:first_name, :last_name, account_attributes: [:id, :active, :email, :password, :password_confirmation, :location, :about, :avatar, :terms, :accountable_id, :accountable_type ] )
  end
end
