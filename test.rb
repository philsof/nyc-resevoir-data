require 'ascii_charts'

class Reservoir

  attr_reader :name, :data

  def initialize(name, data)
    @name = name
    @data = data
  end

  def add_data(datas)
    @data << datas
  end

  def vizualize
  info = data.map {|datapoint| [datapoint.reservoir, datapoint.level] }
  puts AsciiCharts::Cartesian.new(info, :bar => true).draw
  end

end

class DataPoint

  attr_reader :reservoir, :date, :level

  def initialize(reservoir, date, level)
    @reservoir = reservoir
    @date = date
    @level = level
  end

end

one = DataPoint.new("Never Sink", "1/1/15", 88)
two = DataPoint.new("Never Sink","1/2/15", 89)
three = DataPoint.new("Never Sink","1/3/15", 92)
four = DataPoint.new("Never Sink","1/4/15", 95)
five = DataPoint.new("Never Sink","1/5/15", 88)

data = [one, two, three, four, five]

never_sink = Reservoir.new("Never Sink", data)

never_sink.vizualize



