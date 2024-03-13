require_relative 'instance_counter.rb'
require_relative 'brand.rb'

class Train
  include Brand
  include InstanceCounter
  attr_reader :wagons, :route, :current_station_index, :number
  attr_accessor :speed

  @@all = []

  def self.all
    all
  end
  
  def self.find(number)
    all.find {|train| train.number == name}
  end

  def initialize(number)
    @number = number
    @speed = 0
    @wagons = []
    all << self
    register_instance
  end

  def stop
    speed = 0
  end

  def hitch_wagon(wagon)
    wagons << wagon
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
end