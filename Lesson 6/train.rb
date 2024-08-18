require_relative 'instance_counter'
require_relative 'brand'

class Train
  include Brand
  include InstanceCounter
  attr_reader :wagons, :route, :current_station_index, :number
  attr_accessor :speed

  NUMBER_FORMAT = /^[а-я0-9]{3}-?[a-я0-9]{2}$/i

  @@all = []

  def self.all
    all
  end
  
  def self.find(number)
    all.find {|train| train.number == number}
  end

  def initialize(number)
    validate!(number)
    @number = number
    @speed = 0
    @wagons = []
    @@all << self
  end

  def stop
    self.speed = 0
  end

  def hitch_wagon(wagon)
    wagons << wagon if speed.zero?
  end

  def unhitch_wagon(wagon)
    wagons.delete(wagon) if speed.zero?
  end

  def wagons_number
    wagons.size
  end

  def select_route(route)
    @route = route
    @current_station_index = 0
  end

  def current_station
    @route.stations[current_station_index]
  end

  def next_station
    @route.stations[current_station_index + 1]
  end

  def previous_station
    @route.stations[current_station_index - 1]
  end

  def go_next_station
    @current_station_index += 1 if next_station
  end

  def go_previous_station
    @current_station_index -= 1 if previous_station
  end

  def valid?
    validate!(number)
    true
  rescue RuntimeError
    false
  end

  protected

  def validate!(number)
    raise 'Неправильный формат номера поезда' if number !~ NUMBER_FORMAT
  end
end