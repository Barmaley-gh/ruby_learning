require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'train.rb'
require_relative 'train_cargo.rb'
require_relative 'train_passenger.rb'
require_relative 'wagon.rb'
require_relative 'wagon_cargo.rb'
require_relative 'wagon_passenger.rb'
require_relative 'brand.rb'
require_relative 'instance_counter.rb'

class UserConsole
  #здесь написана консоль и методы взаимодействия с ней пользователя, поэтому оставляю их в public
  MENU = { 'Создать станцию': 'create_station',
           'Создать поезд': 'create_train',
           'Создать маршрут и управлять им': 'create_route',
           'Назначить маршрут поезду': 'assign_route',
           'Добавить вагоны к поезду': 'hitch_wagons',
           'Отцепить вагоны от поезда': 'unhitch_wagons',
           'Переместить поезд по маршруту': 'move_train',
           'Посмотреть список станций и поездов на станции': 'stations_and_trains_list',
           'Выход': 'exit' }

  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def menu
    MENU.each_with_index { |(name, key), index | puts "#{index}. #{name}" }
    choose = gets.chomp.to_i
    send(MENU.values[choose])
  end

  private
  attr_reader :stations, :trains, :routes

  def create_station
    puts 'Введите название станции:'
    name = gets.chomp
    stations << Station.new(name)
    menu
  end

  def create_train
    puts 'Выберите тип поезда: 0 - грузовой, 1 - пассажирский'
    type = gets.chomp.to_i
    if type == 0
      puts 'Введите номер поезда:'
      number = gets.chomp
      trains << CargoTrain.new(number)
    elsif type == 1
      puts 'Введите номер поезда:'
      number = gets.chomp
      trains << PassengerTrain.new(number)
    end
    menu
  end

  def create_route
    puts 'Введите название маршрута:'
    route = gets.chomp
    puts 'Начальная станция:'
    start_station = gets.chomp
    puts 'Конечная станция:'
    last_station = gets.chomp
    route = Route.new(start_station, last_station)
    routes << route
    puts 'Редактировать список станций? 0 - да, 1 - нет'
    choose = gets.chomp.to_i
    stations_manager(route) if choose.zero?
    menu
  end

  def assign_route
    train = choose_train
    puts "Выберите маршрут из списка:"
    routes_list
    choose = gets.chomp.to_i
    route = routes[choose]
    train.select_route(route)
    menu
  end

  def hitch_wagons
    train = choose_train
    puts "Сколько вагонов прицепляете?"
    quantity = gets.chomp.to_i
    if train.type == 'cargo'
      train.hitch_wagon(CargoWagon.new)
    elsif train.type == 'passenger'
      train.hitch_wagon(PassengerWagon.new)
    end
    menu
  end

  def unhitch_wagons
    train = choose_train
    puts "Сколько вагонов отцепляете?"
    choose = gets.chomp.to_i
    train.unhitch_wagons(choose) if @wagons.to_i > 0
    menu
  end

  def choose_train
    puts 'Выберите поезд из списка:'
    trains_list
    choose = gets.chomp.to_i
    trains[choose]
  end

  def choose_station
    puts 'Выберите станцию из списка:'
    stations_list
    choose = gets.chomp.to_i
    stations[choose]
  end

  def move_train(route)
    puts "0 - переместить на следующую станцию, 1 - на предыдущую станцию"
    choose = gets.chomp.to_i
    if choose == 0
      train.go_next_station
    elsif choose == 1
      train.go_previous_station
    end
  end

  def stations_manager(route)
    puts '0 - добавить промежуточную станцию, 1 - удалить станцию из списка'
    choose = gets.chomp.to_i
    add_station_in_route if choose.zero?
    delete_station_from_route if choose == 1
  end

  def add_station_in_route(route)
    puts "Введите название добавляемой станции:"
    route.stations.each_with_index(station, index) { |station, index| puts "#{index}. #{station.name}" }
    choose = gets.chomp.to_i
    route.add_station(stations[choose])
  end
  
  def delete_station_from_route(route)
    puts "Выберите из списка, какую станцию удалить:"
    stations_list
    choose = gets.chomp.to_i
    route.delete_station(stations[choose])
    
  end
  
  def stations_and_trains_list
    puts 'Выберите станцию из списка:'
    stations_list
    choose = gets.chomp.to_i
    station = stations[choose]
    station.trains.each_with_index { |train, index| puts "#{index}. #{train.number}" }
  end

  def stations_list
    stations.each_with_index { |station, index| puts "#{index}. #{station.name}"}
  end

  def routes_list
    routes.each_with_index { |route, index| puts "#{index}. #{route.stations}" }
  end

  def trains_list
    trains.each_with_index { |train, index| puts "#{index}. #{train.number}" }
  end
end