require 'board'

describe Board do

  describe '#initialize' do
    it 'creates a cell for each dimension'
  end

  describe '#get_neighbours' do
    context 'when the cell provided is the top left corner' do
      it 'gives the correct 3 neighbours'
    end

    context 'when the cell provided is on the top row' do
      it 'gives the correct 5 neighbours'
    end

    context 'when the cell provided is the top right corner' do
      it ' gives the correct 3 neighbours'
    end

    context 'when the cell provided is in the right column' do
      it 'gives the correct 5 neighbours'
    end

    context 'when the cell provided is the bottom right corner' do
      it 'gives the correct 3 neighbours'
    end

    context 'when the cell provided is on the bottom row' do
      it 'gives the correct 5 neighbours'
    end

    context 'when the cell provided is the bottom left corner' do
      it 'gives the correct 3 neighbours'
    end

    context 'when the cell provided is on the left column' do
      it 'gives the correct 5 neighbours'
    end

    context 'when the cell is in the center' do
      it 'gives the correct 8 neighbours'
    end
  end

end
