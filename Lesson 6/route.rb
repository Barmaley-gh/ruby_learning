require_relative 'instance_counter.rb'
require_relative 'validation.rb'

class Route
  include InstanceCounter
  include Validation
  attr_reader :stations

  def initialize(start_station, last_station)
    @start_station = start_station
    @last_station = last_station
    @stations = [start_station, last_station]
    validate!
    register_instance
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    stations.delete(station)
  end
end