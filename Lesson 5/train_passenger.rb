class PassengerTrain < Train
  include  InstanceCounter
  attr_accessor :type

  def initialize(number)
    super
    @type = 'passenger'
  end
end