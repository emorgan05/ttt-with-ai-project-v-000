require "pry"

class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if board.turn_count % 2 == 0
      current_player = player_1
    else
      current_player = player_2
    end
  end

  def over?
    if board.full?
      true
    # elsif self.won?
    #  true
    else
      false
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_array|
      if win_array.all? { |win_index| board.taken?(win_index) }
        win_index_1 = win_array[0]
        win_index_2 = win_array[1]
        win_index_3 = win_array[2]

        if board.cells[win_index_1] == board.cells[win_index_2] && board.cells[win_index_1] == board.cells[win_index_3]
          return win_index_1, win_index_2, win_index_3
        end
      end
    end
    false
  end

  def draw?
    if board.full? && self.won? == false
      true
    end
  end

  def winner
    if self.won?
      array = self.won?.to_a
      index = array[0]
      winner = board.cells[index]
      winner
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if board.valid_move?(input)
      board.update(input, current_player)
      board.display
    else
      turn
    end
  end

end
