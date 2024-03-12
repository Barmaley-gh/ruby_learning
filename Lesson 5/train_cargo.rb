class CargoTrain < Train
  include  InstanceCounter
  attr_reader :type

  def initialize(number)
    super
    @type = 'cargo'
  end
end