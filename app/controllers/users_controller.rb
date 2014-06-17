class UsersController < ApplicationController

  skip_filter :ensure_logged_in, only: [:new, :create]

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = Player.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      if params[:positions]
        @user.update_positions(params[:positions])
      elsif params[:school]
        CoachingPosition.create school_id: params[:school].to_i, coach_id: @user.id
      end
      redirect_to login_path, notice: "You've registered!"
    else
      flash.now.alert = "Oops, there was an error."
      render :new
    end
  end

  def update
    if @user.save
      if params[:positions]
        # params[:positions].each { |position|
        #   @user.positions << Position
        # }
      end
      redirect_to root_path
    else
      flash.now.alert = "Oops, there was an error."
      render :edit
    end
  end

  def show
    if @user.type == "Player"
      Notification.mark_reviewed("player", params[:id], current_user.id)
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(type.underscore.to_sym).permit(:first_name, :last_name, :email, :password, :password_confirmation, :birthday, :terms, :avatar, :type)
  end

    def set_user
    @user = type_class.find(params[:id])
  end

  def set_type 
       @type = type 
  end

  def type 
      params[:type] || "User" 
  end

  def type_class 
      type.constantize 
  end

end
