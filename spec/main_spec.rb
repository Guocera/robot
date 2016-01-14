describe Robot do
  before do
    @robot = Robot.new
    @another_robot = Robot.new
    @item = Item.new("Item",10)
  end

  it 'should have 100 HP' do
    expect(@robot.health).to eq(100)
  end

  context '#attack!' do
    it 'should do 5 dmg' do
      @robot.attack!(@another_robot)
      expect(@another_robot.health).to eq(95)
    end

    it 'should only be able to attack robots' do
      expect{ @robot.attack!(@item) }.to raise_error StandardError
    end
  end


  context '#heal!' do
    it 'it should raise error' do
      @robot.health = 0
      expect{ @robot.heal! }.to raise_error StandardError
    end
  end
end