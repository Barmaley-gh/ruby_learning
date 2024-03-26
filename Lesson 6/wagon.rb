require_relative 'brand.rb'
require_relative 'validation.rb'

class Wagon
  include Brand
  attr_reader :type
end