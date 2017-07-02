require 'board'

# The Cell class is responsible for determining the initial state of the cell,
# asking the board for it's neighbours, and knowing the next state of the cell

class Cell

  attr_reader :position, :state, :next_state

  ALIVE = :alive
  DEAD = :dead
  MAX_NEIGHBOURS = 3
  MIN_NEIGHBOURS = 2

  def initialize(state: [ALIVE,DEAD].sample, x:, y:, board:)
    @state = state
    @position = [x,y]
    @board = board
  end

  def to_next_state
    get_next_state
    @state = @next_state
  end

  # If alive potentially die
  # if dead, potentially come alive
  # Return a new cell
  def get_next_state
    if @state == DEAD && neighbours == MAX_NEIGHBOURS
      @next_state = ALIVE
    elsif @state == ALIVE && (neighbours < MIN_NEIGHBOURS || neighbours > MAX_NEIGHBOURS)
      @next_state = DEAD
    elsif @state == ALIVE && (neighbours == MIN_NEIGHBOURS || neighbours == MAX_NEIGHBOURS)
      @next_state = ALIVE
    else
      @next_state = DEAD
    end
  end

  # Just grab the neighbours from the board
  def neighbours
    @board.get_live_neighbours(@position)
  end

  def alive?
    if @state == ALIVE
      return true
    else
      return false
    end
  end

end
