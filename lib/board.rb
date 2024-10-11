# lib/board.rb
class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(3) { Array.new(3, ' ') } # Create a 3x3 grid
  end

  # A method to display the state of the board
  def display
    grid.each do |row|
      puts row.join(' | ')
      puts '--+---+--'
    end
  end

  # Place the player's move(symbol) on the board
  def place_move(row, col, symbol)
    # Check if the user has made a valid move
    if valid_move?(row, col)
      grid[row][col] = symbol
      true
    else
      puts "Invalid move! Please enter a valid row and column(0-2) and cell that's empty"
      false
    end
  end

  # Check if the current player has won the game
  def winning_combination?(symbol)
    (0..2).any? { |i| grid[i].all? { |cell| cell == symbol } } || # Check the rows to see the winner
      (0..2).any? { |i| grid.all? { |row| row[i] == symbol } } || # Check colums to see the winner
      [grid[0][0], grid[1][1], grid[2][2]].all? { |cell| cell == symbol } || # top left corner to down right corner
      [grid[0][2], grid[1][1], grid[2][0]].all? { |cell| cell == symbol } # opposite diagonal of the above
  end

  # Ensuring the player makes a legal move
  def valid_move?(row, col)
    row.between?(0, 2) && col.between?(0, 2) && grid[row][col] == ' '
  end

  # Check if the board is full (i.e. a draw)
  def full?
    grid.flatten.none? { |cell| cell == ' ' }
  end
end

symbol = 'X'
col = 1
row = 1
my_board = Board.new

my_board.place_move(row, col, symbol)

my_board.display