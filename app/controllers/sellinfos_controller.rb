class SellinfosController < ApplicationController
  def create
    @sellinfo = Sellinfo.new(sellinfo_params)
    if @sellinfo.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def sellinfo_params
    params.require(:sellinfo).permit(:address, :price, :area, :yield, :name, :meeting)
  end
end
