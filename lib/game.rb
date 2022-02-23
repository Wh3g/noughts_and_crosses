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
    unless @winner.nil? 
      raise "Game over, #{@winner} has won"
    end
    @grid[y_axis][x_axis] = @turn
    check_winner
    @winner
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

  def check_winner
    if check_rows || check_columns || check_diagonals
      @winner = @turn
    end
  end

  def check_rows
    @grid.each do | row |
      if check_fields(row)
        return true
      end
    end
    false
  end

  def check_columns
    3.times do | index |
      if check_fields([@grid[0][index], @grid[1][index], @grid[2][index]])
        return true
      end
    end
    false
  end

  def check_diagonals
    if check_fields([@grid[0][0], @grid[1][1], @grid[2][2]])
      return true
    elsif check_fields([@grid[0][2], @grid[1][1], @grid[2][0]])
      return true
    end
    false
  end

  def check_fields(field_array)
    field_array == [@turn, @turn, @turn]
  end
end