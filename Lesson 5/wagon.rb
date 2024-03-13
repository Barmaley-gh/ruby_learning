require_relative 'brand.rb'

class Wagon
  include Brand
  attr_reader :type
end