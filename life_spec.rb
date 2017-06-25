require 'life'

describe Life do

  describe '#initialize' do

    it 'asks for the area of the size of the board'

    context 'when the size provided is positive and less than 100' do
      it 'creates a board of this size'
      it 'calls the #play_game method'
    end

    context 'when the size provided is negative' do
      it 'returns an error and asks for a new value'
    end

    context 'when the size provided is 0' do
      it 'returns an error and asks for a new value'
    end

    context 'when the size provided is greater than 100' do
      it 'returns an error and asks for a new value'
    end
  end

  describe '#play_game' do

    context 'while there is at least one live cell' do
      it 'shows the current state of the board'
      it 'cycles the cells to the next state'
    end

    context 'when there are no live cells' do
      it 'states that the game is over'
    end
  end
end
