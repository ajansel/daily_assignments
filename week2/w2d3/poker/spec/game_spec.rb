require 'game'
require 'player'

describe "Game" do
  let(:p1) { Player.new("p1")}
  let(:p2) { Player.new("p2")}
  let(:p3) { Player.new("p3")}
  let(:p4) { Player.new("p4")}
  subject(:game) { Game.new(p1, p2, p3, p4) }

  describe "initialize" do
    it "creates a deck of cards" do
      expect(game.deck).to be_a(Deck)
    end

    it "sets the pot to 0" do
      expect(game.pot).to eq(0)
    end

    it "randomly picks a dealer" do
      expect(game.dealer).to be_a(Player)
    end

    it "creates an array of 4 players" do
      expect(game.remaining_players).to be_a(Array)
      expect(game.remaining_players.length).to eq(4)
    end

  end

  describe "#play" do
    it "calls declare_dealer"
    it "declaes the size of the pot"
    it "calls deal"
    it "calls betting_round"
    it "calls discount_round"
    it "calls betting_round again"
    it "calls reveal_cards"
    it "calls round_winner"
    it "calls update_stacks"
    it "calls game_over?"
  end

  describe "#declare_dealer" do
    it "declares to the table who the dealer is, and who moves first"
    #   expect(game.declare_dealer).to include()
    # end
  end

  describe "#deal" do
    it "deals 5 cards to each player" do
      # expect(game.player1.hand).to receive(:give_card!).exactly(5).times
    end
  end

  describe "#betting_round" do
    it "conducts a round of betting --- need more explaining here"
  end

  describe "#discount_round" do
    it "asks the player how many cards they would like to discount"
  end

  describe "#reveal_cards" do
    it "reveals cards"
  end

  describe "#round_winner" do
    it "declares winner of the round"
  end

  describe "#update_stacks" do
    it "updates winner's stack"
    it "sets the pot back to 0"
    it "removes players if any player has a stack > 0"
  end

  describe "#game_over?" do
    it "ends if there is only one player with stack > 0"
  end
end
