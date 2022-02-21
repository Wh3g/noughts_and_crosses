class Game
  attr_reader :grid
  def initialize
    @grid = [["", "", ""], ["", "", ""], ["", "", ""]]
  end
  
  def play_x(y_axis, x_axis)
    @grid[y_axis][x_axis] = "X"
  end
end