class Station
  attr_accessor :trains
  
  def initialize(name)
    @name = name
    @trains = []
  end

  def accept_train(train)
    if train.instance_of?(Train)
      trains << train
    end
  end

  def trains_list_type(type)
    trains.select do |train|
      train.type == type
    end
  end

  def send_train(train)
    trains.select do |train|
      trains.delete(train)
    end
  end
end

class Route
  attr_accessor :start_station
  attr_accessor :last_station
  attr_accessor :all_stations
  attr_accessor :transit_stations

  def initialize(start_station, last_station)
    @transit_stations = []
  end

  def add_station(add_station)
    transit_stations << add_station
    all_stations = [start_station, *transit_stations, last_station]
  end

  def del_station(del_station)
    if transit_stations.include?(del_station)
      transit_stations.delete(del_station)
      all_stations = [start_station, *transit_stations, last_station]
    end
  end
end

class Train
  attr_accessor :speed
  attr_accessor :wagons
  attr_accessor :route
  attr_accessor :station_index
  attr_accessor :previous_station
  attr_accessor :current_station
  attr_accessor :next_station
  
  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons
    @speed = 0
  end

  def hitch_wagon
    if speed == 0
      self.wagons += 1
    end
  end

  def unhitch_wagon
    if (speed == 0) & (wagons > 0)
      self.wagons -= 1
    end
  end

  def select_route(sel_route)
    if sel_route.instance_of?(Route)
      self.route = sel_route
      self.station_index = 0
    end
  end

  def current_station
    self.route.all_stations[self.station_index]
  end

  def next_station
    self.route.all_stations[self.station_index + 1]
  end

  def previous_station
    self.route.all_stations[self.station_index - 1]
  end

  def go_next_station
    self.station_index += 1 if next_station
  end

  def go_previous_station
    self.station_index -= 1 if previous_station
  end
end