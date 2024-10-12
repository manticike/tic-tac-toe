# lib/game.rb
require_relative 'board'
require_relative 'player'

class Game
  def initialize
    @board = Board.new
    @player1 = Player.new('Player 1', 'X')
    @player2 = Player.new('Player 2', 'O')
    @current_player = @player1
  end

  # Switch between players
  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  # Get and validate the player's input
  def get_player_move
    puts "#{@current_player.name} (#{@current_player.symbol}), enter row and column (1-9): "
    gets.chomp.to_i
  end

  # Start the game loop
  def play
    loop do
      @board.display
      input = get_player_move
      
      # Place move using the single input (1-9)
      if @board.place_move_by_index(input, @current_player.symbol)
        if @board.winning_combination?(@current_player.symbol)
          @board.display
          puts "#{@current_player.name} wins!"
          break
        elsif @board.full?
          puts "It's a draw!"
          break
        end

        switch_player
      else
        puts 'Invalid move, try again.'
      end
    end
  end
end