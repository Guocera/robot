class Robot
  attr_accessor :health, :attack_power, :position

  class RobotAlreadyDeadError < StandardError;  end
  class UnattackableEnemyError < StandardError;  end

  def initialize
    @health = 100
    @attack_power = 10
    @position =[0,0]
  end

  def pick_up(item)
    item.feed(self) if health <= 80
  end



  def move_up
    position[1] += 1
  end

  def move_down
    position[1] -= 1
  end

  def move_left
    position[0] -= 1
  end

  def move_right
    position[0] += 1
  end

  def wound(dmg)
    self.health -= dmg
  end

  def within_range(enemy)
    ( (enemy.position[0] <= position[0] + 1) && (enemy.position[0] >= position[0] - 1) &&\
      (enemy.position[1] <= position[1] + 1) && (enemy.position[1] >= position[1] - 1) )
  end

  def attack(enemy)
    if within_range(enemy)
      enemy.wound(self.attack_power)
    end
  end

  def attack!(enemy)
    raise UnattackableEnemyError, 'Cannot attack non-Robots.' unless enemy.is_a? Robot
    self.attack(enemy)
  end

  def heal(robot)
    raise RobotAlreadyDeadError, 'Robot is dead.' if self.health <= 0
    raise RobotAlreadyDeadError, 'Already at max health.' if robot.health <= 0
    robot.health += 10
  rescue RobotAlreadyDeadError => e
    # puts e.message
  end

  def heal!
    heal(self)
  end


end