require_relative 'weapon'

class Laser < Weapon
  attr_reader :range

  def initialize
    @range = 1
  end

end