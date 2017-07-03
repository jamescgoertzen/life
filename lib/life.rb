require 'board'

# The Life class is responsible for asking for a valid area, initializing the
# board, playing the game while at least one cell is alive, and ending the
# game if it goes over 1000 rounds
class Life

  attr_reader :board

  def initialize(board_size)
    if board_size > 0 && board_size < 11
      @board = Board.new(dimensions: board_size)
    else
      abort("Invalid board size.")
    end
  end

  def play_game
    rounds = 0
    while @board.living_cells > 0 && rounds < 1000
      @board.all_cells_get_next_state
      @board.all_cells_to_next_state
      rounds += 1
    end
    puts "This game went for #{rounds} round(s)! (Max 1000)"
  end

end
