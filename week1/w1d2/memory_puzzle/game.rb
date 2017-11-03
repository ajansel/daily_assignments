require_relative './board.rb'
require_relative './human_player.rb'
require_relative './computer_player.rb'
require 'byebug'

#Check for invalid input from user
#Could add a scoring system to see which player "wins" according to their score.... This would change the winner display at the end
#Could implement scoring system
#Could make multiple players play

class Game

  def initialize(player1, player2, size=[2, 3])
    @size = size
    @board = Board.new(size)
    @player1 = player1
    @player2 = player2
  end

  def play
    until over?
      take_turn
    end
    puts "Congrats #{@player2}, you won!"
  end

  def switch_players!
    @player1, @player2 = @player2, @player1
  end

  def take_turn
    make_guess
    switch_players!
  end

  def over?
    @board.won?
  end

  # def valid_input?(input)
  #   bool1 = input[0].to_i < @size[0]
  #   bool2 = input[1] == ","
  #   bool3 = input[2].to_i < @size[1]
  # end

  def make_guess
    @board.render
    guessed_pos = @player1.prompt
    value1 = @board.reveal(guessed_pos)
    @player1.receive_revealed_card(guessed_pos, value1)
    @player2.receive_revealed_card(guessed_pos, value1)
    @board.render
    previous_guess = guessed_pos
    guessed_pos = @player1.prompt(previous_guess)
    value2 = @board.reveal(guessed_pos)
    @player1.receive_revealed_card(guessed_pos, value2)
    @player2.receive_revealed_card(guessed_pos, value2)
    @board.render

    if (value1 == value2) && guessed_pos != previous_guess
      @player1.receive_match(guessed_pos, previous_guess)
      @player2.receive_match(guessed_pos, previous_guess)
    else
      @board[guessed_pos].hide
      @board[previous_guess].hide
    end

    sleep(3)
    system("clear")
  end
end
