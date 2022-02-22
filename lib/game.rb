class Game
  attr_reader :grid
  def initialize
    @grid = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
    @turn = :x
  end
  
  def play_turn(y_axis, x_axis)
    unless @grid[y_axis][x_axis].nil?
      raise "this square is taken"
    end
    @grid[y_axis][x_axis] = @turn
    switch_turn
  end

  def switch_turn
    case @turn
    when :x
      @turn = :o
    when :o
      @turn = :x
    end
  end
end