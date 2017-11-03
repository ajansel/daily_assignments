require 'byebug'
require 'deck.rb'

describe "Deck" do
  subject(:deck) { Deck.new() }

  describe "#initialize" do
    let(:hearts) do
      count = 0
      deck.cards.each do |card|
        count += 1 if card.suit == :hearts
      end
      count
    end

    let(:values) do
      count = 0
      deck.cards.each do |card|
        count += 1 if card.value == :nine
      end
      count
    end

    it "has 52 cards" do
      expect(deck.cards.length).to eq(52)
    end

    it "has 13 hearts" do
      expect(hearts).to eq(13)
    end

    it "has 4 nines" do
      expect(values).to eq(4)
    end
  end

  describe "#my_shuffle!" do
    let(:ordered_deck) do
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

    it "returns an array" do
      expect(deck.my_shuffle!).to be_a(Array)
    end

    it "returns an array of cards in different order" do
      expect(deck.my_shuffle!).to_not eq(ordered_deck)
    end
  end

  describe "#give_card!" do
    it "returns a card" do
      expect(deck.give_card!).to be_a(Card)
    end

    it "descreases the deck size" do
      deck.give_card!
      expect(deck.cards.length).to eq(51)
    end
  end
end
