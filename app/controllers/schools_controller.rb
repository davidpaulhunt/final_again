class SchoolsController < ApplicationController

  before_action :set_school, only: [:show, :edit, :update]

  def index
    @schools = School.all
  end

  def new
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

end