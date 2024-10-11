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
    # Check the rows and column for a winner
    (0..2).each do |i|
      return true if grid[i][0] == symbol && grid[i][1] == symbol && grid[i][2] == symbol ||
                     grid[0][i] == symbol && grid[1][i] == symbol && grid[2][i] == symbol
    end

    # Check main diagonal
    if grid[0][0] == symbol && grid[1][1] == symbol && grid[2][2] == symbol
      return true
    end

    # Check anti-diagonal
    if grid[0][2] == symbol && grid[1][1] == symbol && grid[2][0] == symbol
      true
    end
  end

  # Ensuring the player makes a legal move
  def valid_move?(row, col)
    row.between?(0, 2) && col.between?(0, 2) && grid[row][col] == ' '
  end
end

symbol = 'X'
col = 1
row = 1
my_board = Board.new

my_board.place_move(row, col, symbol)

my_board.display