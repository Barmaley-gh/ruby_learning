class Station
  def initialize(station_name)
     @station_name = station_name
     @station_trains = [] 
  end

  def accept_train(train)
    if train.instance_of?(Train)
      @station_trains << train
    else
      puts "Ошибка, поезд не найден, станция может принимать только существующие поезда"
    end
  end

  def trains_list
    if @station_trains.lenght > 0
    puts @station_trains
    else
      puts "Поездов на станции нет"
    end
  end

  def trains_list_type(type)
    @station_trains.select do |train|
      train.train_type == type
    end
  end

  def send_train(train)
    @station_trains.select do |train|
      @station_trains.delete(train)
    end
  end
end

class Route
  def initialize(start_station, last_station)
    @@start_station = start_station
    @@last_station = last_station
    @transit_stations = []
    @all_stations = [@@start_station, @transit_stations, @@last_station].flatten
  end

  def add_station(add_station)
    @transit_stations << add_station
  end

  def del_station(del_station)
    if @transit_stations.include?(del_station)
      @transit_stations.delete(del_station)
    else
      puts "Станции нет в маршруте, данное действие невозможно выполнить"
    end
  end
  
  def stations_list
    puts @all_stations
  end
end

class Train
  def initialize(train_number, train_type, wagons_number)
    @train_number = train_number
    @@train_type = train_type
    @speed = 0
    @wagons_number = wagons_number
    @train_route = nil
    @current_station = 0
  end

  def accelerate
    @speed += 10
  end

  def brake
    @speed = 0
  end

  def current_speed
    if @speed == 0
      puts "Поезд сейчас не движется"
    else
    puts "Текущая скорость равна #{@speed} км/ч"
    end
  end

  def hitch_wagon
    if @speed != 0
      puts "Вы не можете прицеплять вагоны во время движения, пожалуйста, остановите поезд"
    else
      @wagons_number += 1
    end
  end

  def unhitch_wagon
    if @speed != 0
      puts "Вы не можете отцеплять вагоны во время движения, пожалуйста, остановите поезд"
    elsif @wagons_number == 0
      puts "Все вагоны уже отцеплены, данное действие невозможно выполнить"
    else
      @wagons_number -= 1
    end
  end

  def wagons_number
    if @wagons_number > 0
    puts "К поезду прицеплено #{@wagons} вагонов"
    else
    puts "К поездку не прицеплены вагоны"
    end
  end

  def select_route(select_route)
    if select_route.instance_of?(Route)
      @train_route = select_route
      @current_station = @all_stations[0]
      puts "Для данного поезда выбран маршрут #{@train_route}"
    else
      puts "Вы можете выбрать маршрут из списка существующих или создать новый"
    end
  end

  def next_station
    @all_stations.each do |x|
      if @current_station != @all_station[-1]
        @current_station += x
        puts @current_station
      else
        @current_station = @@last_station
        puts "Поезд прибыл на конечную станцию - #{@current_station}"
      end
    end
  end

  def previous_station
    @all_stations.each do |x|
      if @current_station != @all_station[0]
        @current_station -= x
        puts @current_station
      else
        @current_station = @@start_station
        puts "Поезд вернулся на начальную станцию - #{@current_station}"
      end
    end
  end

  def current_station
    if @current_station == @all_station[0]
      puts "Поезд находится на начальной станции - #{@current_station}, следующая станция - #{@current_station.next_station}"
    elsif @current_station == @all_station[-1]
      puts "Поезд находится на конечной станции - #{@current_station}, предыдущая станция - #{@current_station.previous_station}"
    else
      puts "Поезд находится на станции #{@current_station}, предыдущая станция - #{@current_station.previous_station}, следующая станция - #{@current_station.next_station}"
    end
  end
end