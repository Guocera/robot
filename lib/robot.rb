class Robot
  attr_reader :attack_power, :position, :items
  attr_accessor :health, :equipped_weapon, :shield_points

  class RobotAlreadyDeadError < StandardError;  end
  class UnattackableEnemyError < StandardError;  end

  @@list = []
  @@robot_id = 0


  def self.list
    @@list
  end

  def initialize
    @health = 100
    @attack_power = 5
    @position =[0,0]
    @items = []
    @shield_points = 50
    @id = @@robot_id
    @@robot_id += 1
    @@list << self
  end

  def items_weight
    @items_weight = items.inject(0) { |total_weight,item| total_weight += item.weight }
  end

  def pick_up(item)
    if (items_weight + item.weight) <= 250
      case item
      when BoxOfBolts
        health <= 80 ? item.feed(self) : items << item
      when Battery
        shield_points <= 40 ? item.recharge(self) : items << item
      when Weapon
        equipped_weapon == nil ? self.equipped_weapon = item : items << item
      when Item
        items << item
      end
    end   
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
    if shield_points > 0
      if dmg <= shield_points
        self.shield_points -= dmg
      else
        self.health -= dmg - shield_points
        self.health = 0 if health < 0
        self.shield_points = 0
      end
    else
      self.health -= dmg
      self.health = 0 if health < 0
    end
  end

  def within_range(enemy, range)
    ( (enemy.position[0] <= position[0] + range) && (enemy.position[0] >= position[0] - range) &&\
      (enemy.position[1] <= position[1] + range) && (enemy.position[1] >= position[1] - range) )
  end

  def attack(enemy)
    if equipped_weapon
      if within_range(enemy, equipped_weapon.range)
        equipped_weapon.hit(enemy)
        self.equipped_weapon = Weapon.destroy
      end
    else
      enemy.wound(attack_power) if within_range(enemy, 1)
    end
  end

  def attack!(enemy)
    raise UnattackableEnemyError, 'Cannot attack non-Robots.' unless enemy.is_a? Robot
    self.attack(enemy)
  end

  def heal(heal_amount)
    self.health += heal_amount
    self.health = 100 if health > 100
  end

  def heal!(heal_amount)
    raise StandardError if health == 0
    heal(10)
  end

  # def heal(robot)
  #   raise RobotAlreadyDeadError, 'Robot is dead.' if self.health <= 0
  #   raise RobotAlreadyDeadError, 'Already at max health.' if robot.health <= 0
  #   robot.health += 10
  # rescue RobotAlreadyDeadError => e
  #   # puts e.message
  # end

  # def heal!
  #   heal(self)
  # end


end