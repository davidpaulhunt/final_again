class PositionNeedsController < ApplicationController

  def create
    needs = params[:position_needs]
    school_id = params[:position_need][:school_id]
    school = School.find(school_id)
    needs.each do |need|
      if !school.position_needs.where(position_id: need.to_i).present?
        PositionNeed.create(position_id: need, school_id: school_id)
      end
    end
    redirect_to :back
  end

  def destroy
    @position_need = PositionNeed.find(params[:id])
    if @position_need.destroy
      redirect_to root_path
    else
      render :back, notice: "Oops there was an error."
    end
  end

  private

  def position_need_params
    params.require(:position_need).permit(:position_needs, :school_id)
  end

end