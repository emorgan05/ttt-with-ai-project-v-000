require 'pry'

module Players
  class Computer < Player

    def move(board)
      # It makes the most sense to me to use this method to call the methods below. Start with #win and move to the next until there's a good return for variable "move" 
    end

    # win

    # Block

    # fork

    # Center
    def center
      if board.cells[4] = " "
        move = "5"
      end
    end

    # Opposite corner:
    def opposite_corner
      if self.token == "X"
        if board.cells[0] == "O"
          move = "9"
        elsif board.cells[8] == "O"
          move = "1"
        elsif board.cells[2] == "O"
          move = "7"
        elsif board.cells[6] = "O"
          move = "3"
      else
        if board.cells[0] == "X"
          move = "9"
        elsif board.cells[8] == "X"
          move = "1"
        elsif board.cells[2] == "X"
          move = "7"
        elsif board.cells[6] = "X"
          move = "3"
      end
    end

    # Empty corner:
    def empty_corner
      if board.cells[0] == " "
        move = "1"
      elsif board.cells[2] == " "
        move = "3"
      elsif board.cells[6] == " "
        move = "7"
      elsif board.cells[8] == " "
        move = "9"
      end
    end

    # Empty side:
    def empty_side
      if board.cells[1] == " "
        move = "2"
      elsif board.cells[3] == " "
        move = "4"
      elsif board.cells[5] == " "
        move = "6"
      elsif board.cells[7] == " "
        move = "8"
      end
    end

  end
end

# Win: If the player has two in a row, they can place a third to get three in a row.
# Block: If the opponent has two in a row, the player must play the third themselves to block the opponent.
# Fork: Create an opportunity where the player has two threats to win
# Blocking an opponent’s fork
# Center: A player marks the center.
# Opposite corner: If the opponent is in the corner, the player plays the opposite corner.
# Empty corner: The player plays in a corner square.
# Empty side: The player plays in a middle square on any of the 4 sides.
