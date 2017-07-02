require 'board'

describe Board do
  let(:board) { Board.new(dimensions: board_size) }
  let(:all_cells) { board.all_cells }
  let(:board_size) { 3 }

  before :example do
    cell = instance_double("Cell", to_next_state: nil)
    allow(Cell).to receive(:new).and_return(cell)
  end

  describe '#initialize' do
    it 'creates a cell for each position' do
      expect(all_cells.length).to eq(9)

      board
    end
  end

  describe '#get_live_neighbours' do
    it 'calls #alive? on each cell in @all_cells' do
      cell = spy("Cell")

      expect(cell).to receive(:alive?)

      board.get_live_neighbours
    end

    it ''
  end

  describe '#possible_neighbours' do
    it 'creates an array of all possible neighbours' do
      expect((board.possible_neighbours([1,1])).length).to eq(8)
    end
  end

  describe '#all_cells_to_next_state' do
    it 'calls #to_next_state on each cell' do
      cell = spy("Cell")

      expect(cell).to receive(:to_next_state)

      board.all_cells_to_next_state
    end
  end

end
