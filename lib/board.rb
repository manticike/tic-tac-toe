# lib/board.rb

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(3) { Array.new(3, ' ') } # Create a 3x3 grid
  end

  # A method to display the state of the board
  def display
    grid.each_with_index do |row, index|
      puts row.join(' | ')
      puts '--+---+--' unless index == 2
    end
  end

  # Convert the 1D index back to (row, col) for internal grid usage
  def from_index(index)
    [index / 3, index % 3] # Convert 1D index (0-8) to 2D (row, col)
  end

  # Place moves using single digit index (1-9)
  def place_move_by_index(index, symbol)
    if index.between?(1, 9) # Valid input check (1-9)
      row, col = from_index(index - 1) # Convert to zero-based index
      if valid_move?(row, col)
        grid[row][col] = symbol
      else
        puts 'Invalid move. Cell already taken.'
      end
    else
      puts 'Invalid move. Please enter a number between 1 and 9.'
    end
  end

  # Check if the current player has won the game
  def winning_combination?(symbol)
    (0..2).any? { |i| grid[i].all? { |cell| cell == symbol } } || # Check the rows for a winner
      (0..2).any? { |i| grid.all? { |row| row[i] == symbol } } || # Check the columns for a winner
      [grid[0][0], grid[1][1], grid[2][2]].all? { |cell| cell == symbol } || # Check main diagonal
      [grid[0][2], grid[1][1], grid[2][0]].all? { |cell| cell == symbol }    # Check opposite diagonal
  end

  # Ensure the player makes a legal move
  def valid_move?(row, col)
    row.between?(0, 2) && col.between?(0, 2) && grid[row][col] == ' '
  end

  # Check if the board is full (i.e., a draw)
  def full?
    grid.flatten.none? { |cell| cell == ' ' }
  end
end