describe Robot do
  before do
    @robot1 = Robot.new
    @robot2 = Robot.new
    @robot3 = Robot.new
    @robot3.move_up
    @robot4 = Robot.new
    @robot4.move_up
    @robot4.move_up
  end

  it 'should be able to find neighbor robots' do
    expect(@robot1.scan).to include(@robot1, @robot2, @robot3)
#  pp @robot1.scan
  end
end