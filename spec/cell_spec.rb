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

  describe '#initialize' do
    it 'sets an initial cell state' do
      expect(cell.state).to eq(alive).or(eq(dead))
    end

    it 'sets the cell coordinates' do
      expect(cell.position).to eq([1,1])
    end
  end

  describe '#to_next_state' do
    it 'calls #get_next_state' do
      expect(cell).to receive(:get_next_state)

      cell.to_next_state
    end
    it 'replaces @state with @next_state' do
      allow(cell).to receive(:get_next_state)
      expect(cell.state).to_not eq(cell.next_state)

      cell.to_next_state

      expect(cell.state).to eq(cell.next_state)
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
      before :example do
        state = dead
      end

      context 'and when #neighbours returns the max neighbours' do
        before :example do
          allow(cell).to receive(:neighbours).and_return(max_neighbours)
        end
        it_behaves_like "it will live"
      end

      context 'and when #neighbours returns less than the max neighbours' do
        before :example do
          allow(cell).to receive(:neighbours).and_return(max_neighbours-1)
        end
        it_behaves_like "it will die"
      end

      context 'and when #neighbours returns more than the max neighbours' do
        before :example do
          allow(cell).to receive(:neighbours).and_return(max_neighbours+1)
        end
        it_behaves_like "it will die"
      end
    end

    context 'when @state is alive' do
      before :example do
        state = alive
      end

      context 'and when #neighbours returns less than min neighbours' do
        before :example do
          allow(cell).to receive(:neighbours).and_return(min_neighbours-1)
        end
        it_behaves_like "it will die"
      end

      context 'and when #neighbours returns more than max neighbours' do
        before :example do
          allow(cell).to receive(:neighbours).and_return(max_neighbours+1)
        end
        it_behaves_like "it will die"
      end

      context 'and when #neighbours returns the min neighbours' do
        before :example do
          allow(cell).to receive(:neighbours).and_return(min_neighbours)
        end
        it_behaves_like "it will live"
      end

      context 'and when #neighbours returns the max neighbours' do
        before :example do
          allow(cell).to receive(:neighbours).and_return(max_neighbours)
        end
        it_behaves_like "it will live"
      end
    end
  end

  describe '#neighbours' do
    it 'calls #get_neighbours from the board'
  end


end
