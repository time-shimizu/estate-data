namespace :task_resister do
  desc '全てのdistanceを復活させる'
  task resister_all: :environment do
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
        Distance.create(sellinfo_id: sellinfo.id, buyinfo_id: buyinfo.id, distance: distance)
      end
    end

    sellinos = Sellinfo.all
    buyinfos = Buyinfo.all

    sellinos.each do |sellinfo|
      buyinfos.each do |buyinfo|
        resister_distance(sellinfo,buyinfo)
      end
    end
  end
end
