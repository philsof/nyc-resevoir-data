require 'open-uri'
require 'json'
require 'ascii_charts'
require_relative 'models/data_point'
require_relative 'models/resevoir'
require_relative 'models/parser'
require 'pry'

# neversink = Parser.import('neversink')


def vizualize
  neversink = Parser.import('neversink')
  neversink.data.each do |day|
    # binding.pry
    puts "#{day.date}"
    puts AsciiCharts::Cartesian.new([["Never Sink Reservoir", day.level], ["Maximum + 10%", 110]], :bar => true, :title => "NYC Reservoir System Levels").draw
    sleep(0.05)
    system("clear")
  end

end

  # def vizualize_one_point_in_time
  #   info = data.map {|datapoint| [datapoint.reservoir, datapoint.level] }
  #   puts AsciiCharts::Cartesian.new(info, :bar => true, :title => "NYC Reservoir System Levels").draw
  # end

vizualize
