class BuyinfosController < ApplicationController
  def new
    @buyinfo = Buyinfo.new
  end

  def create
    @buyinfo = Buyinfo.new(buyinfo_params)
    google_api_geocode(@buyinfo) if @buyinfo.valid? && @buyinfo.address != '東京23区'
    if @buyinfo.save
      sellinfos = Sellinfo.all
      sellinfos.each do |sellinfo|
        resister_distance(sellinfo,@buyinfo)
      end
      flash[:success] = '登録できました'
      redirect_to new_buyinfo_path
    else
      render 'new'
    end
  end

  private
  def buyinfo_params
    params.require(:buyinfo).permit(:address, :price, :area, :kind, :name, :meeting, :memo)
  end
end
