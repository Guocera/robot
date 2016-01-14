require_relative 'item'

class Weapon < Item
  attr_reader :damage

  def self.destroy;  end

  def hit(enemy)
    enemy.wound(damage)
  end



  def initialize(name, weight, damage)
    super(name, weight)
    @damage = damage
  end
end