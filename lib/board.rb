class Board
  attr_accessor :cells, :index

  def initialize
    @cells = []
    self.reset!
  end

  def reset!
    @cells.clear
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    cells[input.to_i - 1]
  end

  def full?
    if cells.include?(" ")
      false
    else
      true
    end
  end

  def turn_count
    turns = 0
    cells.each do |cell|
      if cell == "X" || cell == "O"
        turns += 1
      end
    end
    turns
  end

  def taken?(input)
    if self.position(input) == "X" || self.position(input) == "O"
      true
    else
      false
    end
  end

  def valid_move?(input)
    if input.to_i >= 1 && input.to_i <= 9 && self.taken?(input) == false
      true
    else
      false
    end
  end

  def update(input, player)
    index = input.to_i - 1
    if self.valid_move?(input)
      cells[index] = player.token
    end
  end

end
