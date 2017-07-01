require 'board'

# The Life class is responsible for asking for an area,
# cycling cells to the next state, and ending the game
class Life

  def initialize(board_size)
    if board_size > 0 && board_size < 11
      @board = Board.new(dimensions: board_size)
      play_game
    else
      abort("Invalid board size.")
    end
  end

  def play_game
    rounds = 0
    while @board.living_cells > 0 && rounds < 100
      @board.all_cells_to_next_state
      rounds += 1
    end
    puts "This game went for #{rounds} rounds! (Max 100)"
  end

end
