class Http
  def self.client(url, token=nil)
    Faraday.new url do |faraday|
      faraday.request :url_encoded
      faraday.adapter Faraday.default_adapter
      faraday.authorization :Bearer, token unless token.nil?
    end
  end
end
