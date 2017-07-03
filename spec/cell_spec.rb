require 'cell'

describe Cell do
  let(:alive) { Cell::ALIVE }
  let(:dead) { Cell::DEAD }
  let(:max_neighbours) { Cell::MAX_NEIGHBOURS }
  let(:min_neighbours) { Cell::MIN_NEIGHBOURS }
  let(:cell) { Cell.new(x: x, y: y, board: double("Board")) }
  let(:state) { cell.state }
  let(:next_state) { cell.next_state }
  let(:position) { cell.position }
  let(:x) { 1 }
  let(:y) { 1 }
  let(:board) { cell.board }

  describe '#initialize' do
    it 'sets an initial cell state' do
      expect(cell.state).to eq(alive).or(eq(dead))
    end

    it 'sets the cell coordinates' do
      expect(cell.position).to eq([1,1])
    end
  end

  describe '#get_next_state' do

    shared_examples "it will die" do
      it "will set @next_state to dead" do
        cell.get_next_state

        expect(next_state).to eq(dead)
      end
    end

    shared_examples "it will live" do
      it "will set @next_state to alive" do
        cell.get_next_state

        expect(next_state).to eq(alive)
      end
    end

    context 'when @state is dead' do
      let(:cell) { Cell.new(state: dead, x: x, y: y, board: double("Board")) }

      context 'and when #live_neighbours returns the max neighbours' do
        before :example do
          allow(cell).to receive(:live_neighbours).and_return(max_neighbours)
        end

        it_behaves_like "it will live"
      end

      context 'and when #live_neighbours returns less than the max neighbours' do
        before :example do
          allow(cell).to receive(:live_neighbours).and_return(max_neighbours-1)
        end

        it_behaves_like "it will die"
      end

      context 'and when #live_neighbours returns more than the max neighbours' do
        before :example do
          allow(cell).to receive(:live_neighbours).and_return(max_neighbours+1)
        end

        it_behaves_like "it will die"
      end
    end

    context 'when @state is alive' do
      let(:cell) { Cell.new(state: alive, x: x, y: y, board: double("Board")) }

      context 'and when #live_neighbours returns less than min neighbours' do
        before :example do
          allow(cell).to receive(:live_neighbours).and_return(min_neighbours-1)
        end
        it_behaves_like "it will die"
      end

      context 'and when #live_neighbours returns more than max neighbours' do
        before :example do
          allow(cell).to receive(:live_neighbours).and_return(max_neighbours+1)
        end
        it_behaves_like "it will die"
      end

      context 'and when #live_neighbours returns the min neighbours' do
        before :example do
          allow(cell).to receive(:live_neighbours).and_return(min_neighbours)
        end
        it_behaves_like "it will live"
      end

      context 'and when #live_neighbours returns the max neighbours' do
        before :example do
          allow(cell).to receive(:live_neighbours).and_return(max_neighbours)
        end
        it_behaves_like "it will live"
      end
    end
  end

  describe '#live_neighbours' do
    it 'calls #get_neighbours from the board' do
      expect(board).to receive(:get_live_neighbours).with(position)

      cell.live_neighbours
    end
  end

  describe '#to_next_state' do
    it 'sets the @state of the cell to the @next_state' do
      expect(cell.state).to_not eq(cell.next_state)

      cell.to_next_state

      expect(cell.state).to eq(cell.next_state)
    end
  end

  describe '#alive?' do
    let(:live_cell) { Cell.new(state: alive, x: x, y: y, board: double("Board")) }
    let(:dead_cell) { Cell.new(state: dead, x: x, y: y, board: double("Board")) }

    it 'returns true if the cell is alive' do
      expect(live_cell.alive?).to eq(true)
    end
    
    it 'returns false if the cell is dead' do
      expect(dead_cell.alive?).to eq(false)
    end
  end

end
