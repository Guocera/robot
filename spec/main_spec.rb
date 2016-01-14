describe Robot do
  before do
    @robot = Robot.new
    @another_robot = Robot.new
    @item = Item.new
  end

  it 'should have 100 HP' do
    expect(@robot.health).to eq(100)
  end

  context '#attack!' do
    it 'should do 10 dmg' do
      @robot.attack!(@another_robot)
      expect(@another_robot.health).to eq(90)
    end

    it 'should only be able to attack robots' do
      expect{ @robot.attack!(@item) }.to raise_error StandardError
    end
  end


  context '#heal!' do
    it 'it should heal 10 hp' do
      @robot.heal!
      expect(@robot.health).to eq(110)
    end

    context 'if robot has 0 hp' do
      it 'should not heal 10 hp' do
        @robot.health = 0
        @robot.heal!
        expect(@robot.health).to eq(0)
      end
    end
      
  
  end

  context '#heal' do
    it 'should heal other robot 10 hp' do
      @robot.heal(@another_robot)
      expect(@another_robot.health).to eq(110)
      expect(@robot.health).to eq(100)
    end

    it 'should be healed by other robot by 10 hp' do
      @another_robot.heal(@robot)
      expect(@robot.health).to eq(110)
      expect(@another_robot.health).to eq(100)
    end

    context 'if robot has 0 hp' do
      before do
        @robot.health = 0
      end

      context 'and if the other robot has hp' do
        it 'should not heal the other robot 10 hp' do
          @robot.heal(@another_robot)
          expect(@another_robot.health).to eq(100)
        end
      end

      context 'or if the other robot has 0 hp' do
        it 'should not heal others 10 hp' do
          @another_robot.health = 0
          @robot.heal(@another_robot)
          expect(@another_robot.health).to eq(0)
        end
      end
    end

    context 'if other robot has 0 hp' do
      before do
        @another_robot.health = 0
      end

      context 'and if the robot has hp' do
        it 'should not heal others 10 hp' do
          @robot.heal(@another_robot)
          expect(@another_robot.health).to eq(0)
        end
      end

      context 'or if the robot has 0 hp' do
        it 'should not heal others 10 hp' do
          @robot.health = 0
          @robot.heal(@another_robot)
          expect(@another_robot.health).to eq(0)
        end
      end
    end
  end
end