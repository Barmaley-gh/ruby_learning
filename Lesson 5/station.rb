require_relative 'instance_counter.rb'

class Station
  include InstanceCounter
  attr_reader :trains, :name

  @@all = []
  
  def initialize(name)
    @name = name
    @trains = []
    all << self
    register_instance
  end

  def self.all
    all
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