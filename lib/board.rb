class Board
  attr_accessor :cells

  cells = []
  
  def initialize
    self.reset!
  end

  def reset!
    cells.clear
    cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    print current state
    puts cells
  end

  def position
    input = gets.strip.to_i
    index = input - 1
  end

  def update(input, player_object)


  end
end
