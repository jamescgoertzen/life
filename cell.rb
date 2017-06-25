require 'life'
require 'board'

# The Cell class is responsible for determining the initial state of the cell,
# asking the board for it's neighbours, and knowing the next state of the cell

class Cell
  ALIVE = :alive
  DEAD = :dead
  def initialize(state: [ALIVE,DEAD].sample, x:, y:, board:)

  end

  # If alive potentially die
  # if dead, potentially come alive
  # Return a new cell
  def get_next_state
    #
  end

  # Just grab the neighbours from the board
  def neighbours
  end

  def state
    # current_state
  end
end
