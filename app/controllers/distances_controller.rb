class DistancesController < ApplicationController
  PER = 20

  def index
    @distances = Distance.page(params[:page]).per(PER)
  end

  def destroy
    Distance.find(params[:id]).destroy
    flash[:success] = "削除しました"
    redirect_to distances_path
  end
end
