require 'player'

describe "Player" do
  subject(:player) { Player.new("AJ") }

  describe "initialize" do
    it "creates a player with a name" do

    end

    it "sets the players stack to 100"
  end

  describe "#get_betting_round_input" do
    it "raises an error for illegal input"
    it "gets their choice of bet, check, fold, call, or raise"
  end

  describe "get_discard_round_input" do
    it "raises an error for illegal input"
    it "gets the number of cards they would like to discount and which cards"
  end
end
