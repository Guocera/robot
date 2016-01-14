describe Robot do
  before do
    @robot = Robot.new
  end

  it 'should have 50 shield points' do
    expect(@robot.shield_points).to eq(50)
  end

  it 'should drain shield then health' do
    @robot.shield_points = 10
    @robot.wound(40)
    expect(@robot.shield_points).to eq(0)
    expect(@robot.health).to eq(70)
  end


end