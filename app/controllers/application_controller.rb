class ApplicationController < ActionController::Base
  class HttpFatalError < StandardError; end

  private

  def google_api_geocode(information)
    res = client(base_url).get url(information)
    raise HttpFatalError, '通信に失敗しました' unless res.success?

    body = JSON.parse(res.body)
    return if body['error_message'].present? || body['results'].blank?

    location = body['results'][0]['geometry']['location']
    information.lat = location['lat']
    information.lng = location['lng']
  end

  def client(url)
    Faraday.new url do |faraday|
      faraday.request :url_encoded
      faraday.adapter Faraday.default_adapter
    end
  end

  def base_url
    'https://maps.googleapis.com/maps/api/geocode/'
  end

  def url(information)
    'json?' + URI.encode_www_form(address: information.address, key: api_key)
  end

  def api_key
    ENV['GOOGLE_MAP_API_KEY']
  end

  def haversine_distance(latlng1: nil, latlng2: nil)
    return nil if latlng1.blank? || latlng2.blank?

    lat1, lng1 = latlng1
    lat2, lng2 = latlng2

    d_lat = (lat2 - lat1) * Math::PI / 180
    d_lng = (lng2 - lng1) * Math::PI / 180

    a = Math.sin(d_lat / 2) *
        Math.sin(d_lat / 2) +
        Math.cos(lat1 * Math::PI / 180) *
        Math.cos(lat2 * Math::PI / 180) *
        Math.sin(d_lng / 2) * Math.sin(d_lng / 2)

    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
    distance = 6371 * c * 1000
    distance
  end

  def resister_distance(sellinfo,buyinfo)
    return if sellinfo.lat.nil? || buyinfo.lat.nil?
    if  Distance.where('(sellinfo_id=?) AND (buyinfo_id=?)',sellinfo.id,buyinfo.id).blank?
      distance = haversine_distance(latlng1: [sellinfo.lat, sellinfo.lng],latlng2: [buyinfo.lat, buyinfo.lng])
      Distance.create(sellinfo_id: sellinfo.id, buyinfo_id: buyinfo.id, distance: distance) if distance <= 10000
    end
  end
end
