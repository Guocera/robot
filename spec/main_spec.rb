describe Robot do
  before do
    @robot = Robot.new
    @another_robot = Robot.new
  end

  it 'should have 100 HP' do
    expect(@robot.health_points).to eq(100)
  end

  context '#heal!' do
    it 'it should heal 10 hp' do
      @robot.heal!
      expect(@robot.health_points).to eq(110)
    end

    context 'if 0 hp' do
      it 'should not heal 10 hp' do
        @robot.health_points = 0
        @robot.heal!
        expect(@robot.health_points).to eq(0)
      end
    end
      
  
  end

  context '#heal' do
    it 'it should heal other robot 10 hp' do
      @robot.heal(@another_robot)
      expect(@another_robot.health_points).to eq(110)
      expect(@robot.health_points).to eq(100)
    end
  end
end