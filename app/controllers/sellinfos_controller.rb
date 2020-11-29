class SellinfosController < ApplicationController

  def index
    #create失敗した後、リロードするとindexにとんでエラー起きるので
    redirect_to new_sellinfo_path
  end
  def new
    @sellinfo = Sellinfo.new
  end

  def create
    @sellinfo = Sellinfo.new(sellinfo_params)
    google_api_geocode(@sellinfo) if @sellinfo.valid?
    if @sellinfo.save
      buyinfos = Buyinfo.all
        if buyinfos
        buyinfos.each do |buyinfo|
          resister_distance(@sellinfo,buyinfo)
        end
      end
      flash[:success] = '登録できました'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    Sellinfo.find(params[:id]).destroy
    flash[:success] = "削除しました"
    redirect_to distances_path
  end

  private
  def sellinfo_params
    params.require(:sellinfo).permit(:address, :price, :area, :yield, :kind, :name, :meeting)
  end
end
