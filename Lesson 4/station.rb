class Station
  attr_reader :trains, :name
  
  def initialize(name)
    @name = name
    @trains = []
  end

  def accept_train(train)
    trains << train
  end

  def send_train(train)
    trains.delete(train)
  end
  
  def trains_by_type(type)
    trains.select { |train| train.type == type }
  end

end