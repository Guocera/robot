describe Battery do
  before do
    @battery = Battery.new("Battery", 25)
    @robot = Robot.new
  end

  it 'should have weight of 25' do
    expect(@battery.weight).to eq(25)
  end

  it 'should recharge shield' do
    @robot.shield_points = 40
    @robot.pick_up(@battery)
    expect(@robot.shield_points).to eq(50)
  end
end