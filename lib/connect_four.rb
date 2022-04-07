class Game
  attr_accessor :board, :red, :yellow, :turn
  def initialize
    @board = Array.new(6) { Array.new(7) { "\u25cb" } }
    @yellow = "\e[1;33m\u25cf\e[0m"
    @red = "\e[31m\u25cf\e[0m"
    @turn = 1
  end
  
  def display
    grid = ""
    @board.map do |data|
      grid += "|"+data.join("|")+"|\n"
    end
    puts grid
  end

  def placing(column)
    index = empty_row?(column)
    @board[index][column] = @turn.odd? @red : @yellow
  end

  def empty_row?(column)
    index=0
    while index != 5
      index+=1
      if  @board[index][column] != "\u25cb"
        index-=1
        break
      end
    end
    index
  end

  def full?
    full = 0
    @board.map do |data|
      full += 1 if data.none?("\u25cb")
    end
    full == 6 ? true : false
  end
  
end