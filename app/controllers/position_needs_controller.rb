class PositionNeedsController < ApplicationController

  def create
    needs = params[:position_needs]
    coach_id = params[:position_need][:coach_id]
    coach = Coach.find(coach_id)
    needs.each do |need|
      if !coach.position_needs.where(position_id: need.to_i).present?
        PositionNeed.create(position_id: need, coach_id: coach_id)
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
    params.require(:position_need).permit(:position_needs, :coach_id)
  end

end