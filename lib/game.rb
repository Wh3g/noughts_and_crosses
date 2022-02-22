class Game
  attr_reader :grid, :winner
  def initialize
    @grid = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
    @turn = :x
    @winner = nil
  end
  
  def play_turn(y_axis, x_axis)
    unless @grid[y_axis][x_axis].nil?
      raise "this square is taken"
    end
    @grid[y_axis][x_axis] = @turn
    check_rows
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

  def check_rows
    @grid.each do | row |
      if row[0] == row[1] && row[0] == row[2]
        @winner = @turn
      end
    end
  end
end