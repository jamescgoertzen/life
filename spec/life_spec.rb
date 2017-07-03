require 'life'

describe Life do

  let(:alive) { Life::ALIVE }
  let(:dead) { Life::DEAD }
  let(:life) { Life.new(board_size) }
  let(:board) { life.board }

  describe '#initialize' do

    context 'when the size provided is 1' do
      let(:board_size) { 1 }

      it 'creates a new board and sends it the size' do
        expect(Board).to receive(:new).with(dimensions: board_size)

        life
      end
    end

    context 'when the size provided is 10' do
      let(:board_size) { 10 }

      it 'creates a new board and sends it the size' do
        expect(Board).to receive(:new).with(dimensions: board_size)

        life
      end
    end

# Do I need to test if abort works? It seems to abort my tests...

#    context 'when the size provided is less than 1' do
#      let(:board_size) { 0 }
#      it 'returns an error' do
#        expect(life).to receive(:abort).and_return(true)
#      end
#    end

#    context 'when the size provided is greater than 10' do
#      let(:board_size) { 11 }
#      it 'returns an error' do
#        expect(life).to output("Invalid board size.").to_stderr
#      end
#    end
  end

# The stdout's are showing in my test results. Doesn't seem to affect them
# but it's annoying.

  describe '#play_game' do
    let(:board_size) { 5 }
    before :each do
      game_board = double("Board")
      allow(Board).to receive(:new).and_return(game_board)
    end

    context 'while there is at least one live cell' do
      it 'calls #all_cells_get_next_state 1000 times' do
        allow(board).to receive(:living_cells).and_return(1)
        allow(board).to receive(:all_cells_to_next_state)

        expect(board).to receive(:all_cells_get_next_state).exactly(1000).times

        life.play_game
      end

      it 'calls #all_cells_to_next_state 1000 times' do
        allow(board).to receive(:living_cells).and_return(1)
        allow(board).to receive(:all_cells_get_next_state)

        expect(board).to receive(:all_cells_to_next_state).exactly(1000).times

        life.play_game
      end
    end

    context 'when there are no live cells' do
      it 'states the number of rounds the game went for' do
        allow(board).to receive(:living_cells).and_return(0)

        expect(board).to receive(:all_cells_to_next_state).exactly(0).times

        life.play_game
      end
    end
  end

end
