module Players
  class Human < Player

    def move(board)
      puts "Choose a square by putting in a number 1 - 9"
      input = gets.strip
    end

  end
end
