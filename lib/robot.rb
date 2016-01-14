class Robot
  attr_accessor :health_points

  class RobotAlreadyDeadError < StandardError;  end
  class UnattackableEnemyError < StandardError;  end

  def initialize
    @health_points = 100
  end

  def attack!(enemy)
    raise UnattackableEnemyError, 'Cannot attack non-Robots.' unless enemy.is_a? Robot
    enemy.health_points -= 10
  end

  def heal(robot)
    raise RobotAlreadyDeadError, 'Robot is dead.' if self.health_points <= 0
    raise RobotAlreadyDeadError, 'Already at max health.' if robot.health_points <= 0
    robot.health_points += 10
  rescue RobotAlreadyDeadError => e
    # puts e.message
  end

  def heal!
    heal(self)
  end


end