require_relative 'wagon'

class PassengerWagon < Wagon
  def initialize
    super
    @type = 'passenger'
    validate!
  end
end