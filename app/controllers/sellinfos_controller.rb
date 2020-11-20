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
    google_api_geocode(@sellinfo)
    if @sellinfo.save
      flash[:success] = '登録できました'
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def sellinfo_params
    params.require(:sellinfo).permit(:address, :price, :area, :yield, :name, :meeting)
  end

  def google_api_geocode(sellinfo)
    res = Http.client(base_url).get url(sellinfo)
    raise HttpFatalError, '通信に失敗しました' unless res.success?

    body = JSON.parse(res.body)
    return if body['error_message'].present? || body['results'].blank?

    location = body['results'][0]['geometry']['location']
    @sellinfo.lat = location['lat']
    @sellinfo.lng = location['lng']
  end

  def base_url
    'https://maps.googleapis.com/maps/api/geocode/'
  end

  def url(sellinfo)
    'json?' + URI.encode_www_form(address: sellinfo.address, key: api_key)
  end

  def api_key
    ENV['GOOGLE_MAP_API_KEY']
  end
end
