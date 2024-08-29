require_relative 'instance_counter'

class Station
  include InstanceCounter
  attr_reader :trains, :name

  @@all = []
  
  def initialize(name)
    validate!(name)
    @name = name
    @trains = []
    @@all << self
  end

  def self.all
    @@all
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

  def trains_to_block(&block)
    raise 'Не указан блок' unless block_given?
    @trains.each(&block)
  end

  def valid?
    validate!(name)
    true
  rescue RuntimeError
    false
  end

  private

  def validate!(name)
    raise 'Название не может быть пустым' if name.nil? || name.empty?
  end
end