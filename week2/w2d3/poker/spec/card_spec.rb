require 'byebug'
require 'card.rb'

describe "Card" do
  subject(:card) { Card.new(:queen, :hearts) }

  describe "#initialize" do
    it "has a value" do
      expect(card.value).to eq(:queen)
    end

    it "has a suit" do
      expect(card.suit).to eq(:hearts)
    end
  end
end
