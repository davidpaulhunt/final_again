class AccountsController < ApplicationController

  skip_filter :ensure_logged_in, only: [:new, :create]

  before_action :set_account, only: [:show, :edit, :update, :destroy]

  def index
    @account = Account.all
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to login_path, notice: "You've registered!"
    else
      flash.now.alert = "Oops, there was an error."
      render :new
    end
  end

  def update
    if @account.update_attributes(account_params)
      redirect_to root_path
    else
      flash.now.alert = "Oops, there was an error."
      render :edit
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @account.active = false
    @account.save!
    redirect_to login_path
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:email, :password, :password_confirmation, :location, :about, :terms, :avatar, :accountable_id, :accountable_type, :active, :id)
  end

  # def set_user
  #   @user = type_class.find(params[:id])
  # end

  # def set_type 
  #      @type = type 
  # end

  # def type 
  #     params[:type] || "User" 
  # end

  # def type_class 
  #     type.constantize 
  # end

end
