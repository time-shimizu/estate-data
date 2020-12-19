class SellinfosController < ApplicationController
  PER = 20

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

  def edit
    @sellinfo = Sellinfo.find(params[:id])
  end

  def update
    @sellinfo = Sellinfo.find(params[:id])
    if @sellinfo.update_attributes(sellinfo_params)
      google_api_geocode(@sellinfo)
      @sellinfo.distances.destroy_all
      buyinfos = Buyinfo.all
      if buyinfos
        buyinfos.each do |buyinfo|
          resister_distance(@sellinfo,buyinfo)
        end
      end
      flash[:success] = '更新できました'
      redirect_to new_sellinfo_path
    else
      render 'edit'
    end
  end

  def destroy
    Sellinfo.find(params[:id]).destroy
    flash[:success] = "削除しました"
    redirect_to distances_path
  end

  def index
    @sellinfos = Sellinfo.page(params[:page]).per(PER)
  end

  private
  def sellinfo_params
    params.require(:sellinfo).permit(:address, :price, :area, :yield, :kind, :name, :meeting)
  end
end
