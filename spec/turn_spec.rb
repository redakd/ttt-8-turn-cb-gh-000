require_relative "../lib/turn.rb"

describe './lib/turn.rb' do

  describe '#display_board' do
    it 'prints arbitrary arrangements of the board' do
      board = ["X", "X", "X", "X", "O", "O", "X", "O", "O"]

      output = capture_puts{ display_board(board) }

      expect(output).to include(" X | X | X ")
      expect(output).to include("-----------")
      expect(output).to include(" X | O | O ")
      expect(output).to include("-----------")
      expect(output).to include(" X | O | O ")


      board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

      output = capture_puts{ display_board(board) }

      expect(output).to include(" X | O | X ")
      expect(output).to include("-----------")
      expect(output).to include(" O | X | X ")
      expect(output).to include("-----------")
      expect(output).to include(" O | X | O ")
    end
  end

  describe '#input_to_index' do

    it 'converts a user_input to an integer' do
      user_input = "1"

      expect(input_to_index(user_input)).to be_a(Integer)
    end

    it 'subtracts 1 from the user_input' do
      user_input = "6"

      expect(input_to_index(user_input)).to be(5)
    end

    it 'returns -1 for strings without integers' do
      user_input = "invalid"

      expect(input_to_index(user_input)).to be(-1)
    end

  end

  describe '#valid_move?' do
    it 'returns true/false based on index' do
      board = [" ", " ", " ", " ", "X", " ", " ", " ", " "]

      index = 0
      expect(valid_move?(board, index)).to be_truthy

      index = 4
      expect(valid_move?(board, index)).to be_falsey

      index = -1
      expect(valid_move?(board, index)).to be_falsey
    end
  end

  describe '#move' do
    it 'allows "X" player in the bottom right and "O" in the top left ' do
      board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      move(board, 0, "O")
      move(board, 8, "X")

      expect(board).to eq(["O", " ", " ", " ", " ", " ", " ", " ", "X"])
    end
  end

  describe '#turn' do
    it 'asks the user for input by printing: "Please enter 1-9:"' do
      board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      allow($stdout).to receive(:puts)
      allow(self).to receive(:gets).and_return("1")

      expect($stdout).to receive(:puts).with("Please enter 1-9:")

      turn(board)
    end

    it 'gets the user input' do
      board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      allow($stdout).to receive(:puts)

      expect(self).to receive(:gets).and_return("1")

      turn(board)
    end

      end
end
