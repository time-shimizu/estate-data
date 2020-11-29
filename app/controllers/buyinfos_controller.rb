class BuyinfosController < ApplicationController
  def new
    @buyinfo = Buyinfo.new
  end

  def create
    @buyinfo = Buyinfo.new(buyinfo_params)
    google_api_geocode(@buyinfo) if @buyinfo.valid?
    if @buyinfo.save
      sellinfos = Sellinfo.all
      if sellinfos
        sellinfos.each do |sellinfo|
          resister_distance(sellinfo,@buyinfo)
        end
      end
      flash[:success] = '登録できました'
      redirect_to new_buyinfo_path
    else
      render 'new'
    end
  end

  def destroy
    Buyinfo.find(params[:id]).destroy
    flash[:success] = "削除しました"
    redirect_to distances_path
  end

  private
  def buyinfo_params
    params.require(:buyinfo).permit(:address, :lowest_price, :highest_price, :lowest_area, :highest_area, :kind, :name, :meeting, :memo)
  end
end
