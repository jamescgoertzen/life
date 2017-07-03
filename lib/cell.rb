require 'board'

# The Cell class is responsible for determining the initial state of the cell,
# asking the board for it's neighbours, and knowing the next state of the cell

class Cell

  attr_reader :position, :state, :next_state, :board

  ALIVE = :alive
  DEAD = :dead
  MAX_NEIGHBOURS = 3
  MIN_NEIGHBOURS = 2

  def initialize(state: [ALIVE,DEAD].sample, x:, y:, board:)
    @state = state
    @position = [x,y]
    @board = board
  end

  # If alive potentially die
  # if dead, potentially come alive
  # Return a new cell
  def get_next_state
    if @state == DEAD && live_neighbours == MAX_NEIGHBOURS
      @next_state = ALIVE
    elsif @state == ALIVE && (live_neighbours < MIN_NEIGHBOURS || live_neighbours > MAX_NEIGHBOURS)
      @next_state = DEAD
    elsif @state == ALIVE && (live_neighbours == MIN_NEIGHBOURS || live_neighbours == MAX_NEIGHBOURS)
      @next_state = ALIVE
    else
      @next_state = DEAD
    end
  end

  # Just grab the neighbours from the board
  def live_neighbours
    @board.get_live_neighbours(@position)
  end

  def to_next_state
    @state = @next_state
  end

  def alive?
    if @state == ALIVE
      return true
    else
      return false
    end
  end

end
