

module Parser

  DATES = ["1136073600", "1167609600", "1199145600", "1230768000", "569287440000"]

  CAPACITIES = { "neversink" => 34_900, "cannonsville" => 95_700,
    "schoharie" => 17_600, "pepacton" => 140_200, "rondout" => 49_600 }

  def self.import(resevoir)
    data = load_json

    args = { name: resevoir, capacity: CAPACITIES[resevoir] }

    data_objects = get_data_objects(data, resevoir)

    args[:data] = data_objects

    Resevoir.new(args)
  end

  def self.load_json
    data = open("https://data.cityofnewyork.us/resource/zkky-n5j3.jso://data.cityofnewyork.us/resource/zkky-n5j3?$limit=50000").read
    data = JSON.parse(data)
  end

  def self.get_data_objects(data, resevoir)
    data.each_with_object([]) do |(row), data_points|
      # continue if !DATES.include?(row[resevoir + '_date'])

      date_field = Time.at(row[resevoir + '_date'])
      level = row[resevoir + '_storage'].to_f / CAPACITIES[resevoir] * 100

      args = {date: date_field, level: level}
      data_points << DataPoint.new(args)
    end
  end
end
