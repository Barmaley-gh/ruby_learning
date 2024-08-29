require_relative 'wagon'

class CargoWagon < Wagon
  attr_reader :volume, :empty_volume

  def initialize(volume)
    super()
    @type = 'cargo'
    @volume = volume
    @empty_volume = volume
    validate!
  end

  def take_volume(volume)
    if volume > empty_volume
      raise ArgumentError,
        "Указанный объём #{volume} превышает свободный объём вагона #{empty_volume}"
    end
    self.empty_volume -= volume
  end

  def taken_volume
    self.volume = empty_volume
  end
end