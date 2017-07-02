require 'life'
require 'cell'

# The Board class is responsible for creating the board, creating a cell for each location on the board, and providing a cell with it's neighbours
class Board

  attr_reader :all_cells

  def initialize(dimensions:)
    @all_cells = Array.new
    for x in (1..dimensions) do
      for y in (1..dimensions) do
        @all_cells << Cell.new(x: x, y: y, board: self)
      end
    end
  end

  def get_live_neighbours(cell_position)
    @all_cells.select { |neighbour|
      neighbour.alive? &&
      possible_neighbours(cell_position).include?(neighbour.position)
    }.count
  end

  def possible_neighbours(cell_position)
    [[cell_position[0]-1,cell_position[1]+1],
    [cell_position[0],cell_position[1]+1],
    [cell_position[0]+1,cell_position[1]+1],
    [cell_position[0]+1,cell_position[1]],
    [cell_position[0]+1,cell_position[1]-1],
    [cell_position[0],cell_position[1]-1],
    [cell_position[0]-1,cell_position[1]-1],
    [cell_position[0]-1,cell_position[1]]]
  end

  def all_cells_to_next_state
    @all_cells.each do |cell|
      cell.to_next_state
    end
  end

  def living_cells
    @all_cells.select { |cell|
      cell.alive? == true
    }.count
  end
end
