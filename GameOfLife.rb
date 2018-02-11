class GameOfLife
  attr_writer :board
  attr_reader :width
  attr_reader :height

  def initialize(width, height)
    @board = Array.new(width) { Array.new(height) { 0 } }
    @width = width
    @height = height
  end

  def is_alive(x, y)
    sum = 0
    for i in x - 1..x + 1
      for k in y - 1..y + 1
        if (i != x || k != y) && k >= 0 && i >= 0 && k < @height && i < @width
          if @board[i][k] == 1
            sum += 1
          end
        end
      end
    end
    if @board[x][y] == 1 && ( sum == 2 || sum == 3)
      1
    elsif @board[x][y] == 0 && sum == 3
      1
    else
      0
    end
  end

  def life_cycle
    new_cycle = Array.new(@width) { Array.new(@height) { 0 } }
    for i in 0..@width - 1
      for k in 0..@height - 1
        new_cycle[i][k] = is_alive(i, k)
      end
    end
    @board = new_cycle
  end

  def in_the_beginning
    @board.map! { |row| row.map! { (rand(20) % 3) % 2 } }
  end

  def display
    puts @board.map { |x| x.join(' ') }
  end

  def get_board
    @board
  end

  def set_board (new_board)
    @board = new_board
  end

end
