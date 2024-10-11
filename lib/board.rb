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
    grid[row][col] = symbol
    
    if valid_move
  end

  # Ensuring the player makes a legal move
  def valid_move?(row, col)
    row.between?(0, 2) && col.between?(0, 2) && grid[row][col] == ' '
end

my_board = Board.new

my_board.display
