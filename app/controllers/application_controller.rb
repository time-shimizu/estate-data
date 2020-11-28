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
end
