require_relative 'item'

class Battery < Item

  def recharge(robot)
    robot.shield_points += 10
  end
end