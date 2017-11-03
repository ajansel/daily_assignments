require 'colorize'
require_relative 'card'

class Deck
  attr_reader :cards

  def initialize()
    @cards = self.populate
  end

  def populate
    suits = [ :hearts, :diamonds, :clubs, :spades]
    values = [:two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king, :ace]
    cards = []

    suits.each do |suit|
      values.each do |value|
        cards << Card.new(value, suit)
        # cards << [value, suit]
      end
    end

    cards
  end

  def my_shuffle!
    5.times { @cards.shuffle! }
    self
  end

  def give_card!
    @cards.pop
  end
end
