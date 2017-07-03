require 'board'

describe Board do
  let(:board) { Board.new(dimensions: board_size) }
  let(:all_cells) { board.all_cells }
  let(:board_size) { 3 }

  before :each do
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
    before :each do
      allow(board).to receive(:possible_neighbours).and_return(Array.new(8) { Array.new(2) { 2 } })
    end

    it 'calls #alive? on each cell in @all_cells' do
      all_cells.each do |cell|
        expect(cell).to receive(:alive?)
      end

      board.get_live_neighbours([1,1])
    end

    it 'compares each cell in @all_cells position to an array of possible neighbours' do

      all_cells.each do |cell|
        allow(cell).to receive(:alive?).and_return(true)
        expect(cell).to receive(:position)
      end

      board.get_live_neighbours([1,1])
    end

    # This could be better. Currently there are 9 cells in @all_cells,
    # each one is alive and has a position of [2,2]. This means the count
    # will find the neighbours as well as self
    it 'returns a count of the number of live neighbours' do
      all_cells.each do |cell|
        allow(cell).to receive(:alive?).and_return(true)
        allow(cell).to receive(:position).and_return([2,2])
      end

      expect(board.get_live_neighbours([1,1])).to eq(9)
    end
  end

  describe '#possible_neighbours' do
    it 'creates an array of all possible neighbours' do
      expect((board.possible_neighbours([1,1])).length).to eq(8)
    end
  end

  describe '#all_cells_get_next_state' do
    it 'calls #get_next_state on each cell in @all_cells' do
      all_cells.each do |cell|
        expect(cell).to receive(:get_next_state)
      end

      board.all_cells_get_next_state
    end
  end

  describe '#all_cells_to_next_state' do
    it 'calls #to_next_state on each cell in @all_cells' do
      all_cells.each do |cell|
        expect(cell).to receive(:to_next_state)
      end

      board.all_cells_to_next_state
    end
  end

  describe '#living_cells' do
    it 'calls #alive? on each cell in @all_cells' do
      all_cells.each do |cell|
        expect(cell).to receive(:alive?)
      end

      board.living_cells
    end

    it 'counts the number of live cells in @all_cells' do
      all_cells.each do |cell|
        allow(cell).to receive(:alive?).and_return(true)
      end

      expect(board.living_cells).to eq(board_size*board_size)
    end
  end

end
