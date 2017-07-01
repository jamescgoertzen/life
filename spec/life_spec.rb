require 'life'

describe Life do

  let(:alive) { Life::ALIVE }
  let(:dead) { Life::DEAD }
  let(:game) { Life.new(board_size) }

  describe '#initialize' do
    context 'when the size provided is between 1 and 10' do
      let!(:board_size) { 5 }
      it 'creates a board of this size' do
        expect(Board).to receive(:new).with(dimensions: board_size)

        game
      end

      it 'calls the #play_game method' do
        allow(Board).to receive(:new)

        expect(game).to receive(:play_game)
      end
    end

    context 'when the size provided is less than 1' do
      it 'returns an error and asks for a new value'
    end

    context 'when the size provided is greater than 10' do
      it 'returns an error and asks for a new value'
    end
  end

  describe '#play_game' do

    context 'while there is at least one live cell' do
      it 'calls #draw_board'
      it 'cycles the cells to the next state'
    end

    context 'when there are no live cells' do
      it 'states that the game is over'
    end
  end

end
