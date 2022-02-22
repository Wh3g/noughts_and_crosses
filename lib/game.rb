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
    case @turn
    when :x
      play_x(y_axis, x_axis)
    when :o
      play_o(y_axis, x_axis)
    end
  end

  def play_x(y_axis, x_axis)
    @grid[y_axis][x_axis] = "X"
    @turn = :o
  end

  def play_o(y_axis, x_axis)
    @grid[y_axis][x_axis] = "O"
    @turn = :x
  end
end