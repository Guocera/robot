require_relative 'item'

class BoxOfBolts < Item

  def feed(robot)
    robot.health += 20
  end
end