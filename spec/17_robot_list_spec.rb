describe Robot do
  it 'should return a list of all robots' do
    @robot = Robot.new
    expect(Robot.list).to include(@robot)
    @another_robot = Robot.new
    @another_robot.health = 10
    expect(Robot.list).to include(@robot)
  end
end