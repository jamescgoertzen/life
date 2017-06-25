require 'cell'

describe Cell do

  describe '#initialize' do
    it 'sets an initial cell state'
    it 'sets the cell coordinates'
  end

  describe '#get_next_state' do
    it 'calls #neighbours'
    it 'calls #state'
  end

  describe '#neighbours' do
    it 'calls #get_neighbours from the board'
  end

  describe '#state' do
    context 'when the cell is currently dead with exactly 3 live neighbours' do
      it 'sets the next state of the cell to alive'
    end

    context 'when the cell is currently dead with less than 3 live neighbours' do
      it 'sets the next state of the cell to dead'
    end

    context 'when the cell is currently dead with more than 3 live neighbours' do
      it 'sets the next state of the cell to dead'
    end

    context 'when the cell is currently alive with less than 2 live neighbours' do
      it 'sets the next state of the cell to dead'
    end

    context 'when the cell is currently alive with more than 3 live neighbours' do
      it 'sets the next state of the cell to dead'
    end

    context 'when the cell is currently alive with exactly 2 live neighbours' do
      it 'sets the next state of the cell to alive'
    end

    context 'when the cell is currently alive with exactly 3 live neighbours' do
      it 'sets the next state of the cell to alive'
    end
  end

end
