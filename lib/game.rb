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
    else
      false
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_array|
      if win_array.all? { |win_index| board.taken?(win_index + 1) }
        win_index_1 = win_array[0]
        win_index_2 = win_array[1]
        win_index_3 = win_array[2]
        if board.cells[win_index_1] == board.cells[win_index_2] && board.cells[win_index_1] == board.cells[win_index_3]
          return win_array
        end
      end
    end
    false
  end

  def draw?
    if board.full? && won? == false
      true
    end
  end

  def winner
    if won?
      array = won?
      index = array[0]
      winner = board.cells[index]
      winner
    end
  end

  def turn
    player = current_player
    input = player.move(@board)
    if board.valid_move?(input)
      board.update(input, player)
      board.display
    else
      turn
    end
  end

  def play
    until over? || won? || draw?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    end
    if draw?
      puts "Cat's Game!"
    end
  end

  def self.start
    puts "Welcome to Tic Tac Toe!"
    puts "How many players do you have? Type 0, 1, or 2:"
    num_of_players = gets.strip.to_i

    if num_of_players == 0
      game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))

    elsif num_of_players == 1
      puts "Do you want to go first? Y/n"
      input = gets.strip

      if input == "Y" || input == "y"
        game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
      else
        game = Game.new(Players::Computer.new("X"), Players::Human.new("O"))
      end

    else
      game = Game.new
      puts "Who wants to be X? X will play first."
    end
    game.play
    puts "Would you like to exit? Y/n"
    response = gets.strip
    if response == "n"
      Game.start
    else
      exit
    end
  end

end
