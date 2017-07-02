require 'life'

describe Life do

  let(:alive) { Life::ALIVE }
  let(:dead) { Life::DEAD }
  let(:life) { Life.new(board_size) }
  let(:board) { life.board }

  describe '#initialize' do

    context 'when the size provided is between 1 and 10' do
      let(:board_size) { 5 }

      it 'creates a board of this size'

      it 'calls the #play_game method' do
        board = instance_double("Board")
        allow(Board).to receive(:new)

        expect(Life.new(board_size)).to receive(:play_game)
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
    let(:board_size) { 5 }

    context 'while there is at least one live cell' do
      it 'calls #draw_board' do
        board = instance_double("Board")
        allow(Board).to receive(:new).and_return(board)
        allow(board).to receive(:living_cells).and_return(1)
        expect(board).to receive(:all_cells_to_next_state).exactly(100.times)

        life.play_game
      end
      it 'cycles the cells to the next state'
    end

    context 'when there are no live cells' do
      it 'states that the game is over'
    end
  end

end
