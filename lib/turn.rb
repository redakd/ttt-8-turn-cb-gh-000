def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(index)
  index = index.to_i - 1
end

def valid_move?(board, index)
    if ( board[index] == " " or board[index] == " " ) && ( index <= 8 && index >= 0 )
    true
  else
    false
  end
end

def move(board, index, value = "X")
  if valid_move?(board, index)
    board[index] = value
  else
    puts " please enter a valid number 1 - 9 and not already used! "
  end
end

def turn(board)
  puts "Please enter 1-9:"
  return index = gets.to_i
end

def count_allow_place(board)
  nbr = 0
  count = 0
  while nbr < 9
  if  board[nbr] == " " or board[nbr] == " "
    count += 1
  end
  nbr += 1
end
return count
end
