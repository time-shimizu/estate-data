class DistancesController < ApplicationController
  def index
    @distances = Distance.all
  end

  def destroy
    Distance.find(params[:id]).destroy
    flash[:success] = "削除しました"
    redirect_to distances_path
  end
end
