require_relative 'deck'
require_relative 'player'

class Game
  attr_reader :deck, :pot, :remaining_players, :dealer, :player1, :player2, :player3, :player4

  def initialize(player1, player2, player3, player4)
    @deck = Deck.new().my_shuffle!
    @pot = 0
    @player1 = player1
    @player2 = player2
    @player3 = player3
    @player4 = player4
    @remaining_players = [@player1, @player2, @player3, @player4]
    @dealer = @remaining_players[rand(0..3)]
  end

  def deal
    @remaining_players.each do |player|
      5.times { player.hand << @deck.give_card! }
    end
    @deck
  end

end
