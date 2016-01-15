describe Robot do
  before do
    @robot1 = Robot.new
    @robot2 = Robot.new
    @robot3 = Robot.new
    @robot3.move_up
  end

  it 'should display robots at a given position' do
    expect(Robot.in_position(0, 0)).to include(@robot1, @robot2)
    expect(Robot.in_position(0, 1)).to include(@robot3)
  end
end