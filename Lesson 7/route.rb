require_relative 'instance_counter'

class Route
  include InstanceCounter
  attr_reader :stations

  def initialize(start_station, last_station)
    @start_station = start_station
    @last_station = last_station
    @stations.each { |station| validate!(station) }
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    stations.delete(station)
  end

  def valid?
    @stations.each { |station| validate!(station) }
    true
  rescue RuntimeError
    false
  end

  private

  def validate!(station)
    raise "Станции #{station} не создана" unless station.is_a? Station
  end
end