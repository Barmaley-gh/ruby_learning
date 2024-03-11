class PassengerTrain < Train
  attr_accessor :type

  def initialize(number)
    super
    @type = 'passenger'
  end
end