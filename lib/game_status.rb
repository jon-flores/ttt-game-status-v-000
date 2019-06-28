# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top Row
  [3,4,5], # Middle Row
  [6,7,8], # Bottom Row
  [0,3,6], # Left Column
  [1,4,7], # Middle Column
  [2,5,8], # Right Column
  [0,4,8], # Left-Right Diagonal \
  [2,4,6] # Right-Left Diagonal /
]

# # Board with winning X in the top row.
# board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]
#
# # Definition of indexes that compose a top row win.
# top_row_win = [0,1,2]
#
# # Check if each index in the top_row_win array contains an "X"
# if board[top_row_win[0]] == "X" && board[top_row_win[1]] == "X" && board[top_row_win[2]] == "X"
#   "X won in the top row"
# end

def won?(board)
  WIN_COMBINATIONS.detect do | win_combo |
    board[win_combo[0]] == board[win_combo[1]] && board[win_combo[1]]  == board[win_combo[2]] && position_taken?(board, win_combo[0])
  end
end

def full?(board)
  board.all? do |space|
    !(space.nil? || space == " ")
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  elsif !(won?(board) && full?(board)) || won?(board)
    false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  end
end

def winner(board)
  if win = won?(board)
    board[win[0]]
  end
end
