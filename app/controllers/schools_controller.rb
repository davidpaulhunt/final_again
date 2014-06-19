class SchoolsController < ApplicationController

  before_action :set_school, only: [:show, :edit, :update]
  skip_filter :ensure_logged_in, only: [:new, :create]

  def index
    @schools = School.all
  end

  def new
    @school = School.new
    @school.build_account
  end

  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to root_path
    else
      render :new, notice: "Oops, there was an error."
    end
  end

  def show
    Notification.mark_reviewed("school", params[:id], current_user.id)
  end

  private

  def set_school
    @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(:name, :web_url, account_attributes: [ :email, :password, :password_confirmation, :location, :about, :avatar, :terms, :accountable_id, :accountable_type ] )
  end

end