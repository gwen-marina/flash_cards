require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do

  before :each do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  it "exists" do
    expect(@round).to be_a(Round)
  end

  it "has attributes" do
    expect(@round.deck).to eq(@deck)
    expect(@round.turns).to eq([])
  end

  it "can list the current card in the deck" do
    expect(@round.current_card).to eq(@card_1)
  end

  it "can take turns, return the next card & determine if answer is correct" do
    new_turn = @round.take_turn("Juneau")
    expect(new_turn.class).to eq (Turn)
    expect(new_turn.correct?).to eq true
    expect(@round.turns).to eq ([new_turn])

    expect(@round.current_card).to eq (@card_2)
    expect(@round.take_turn("Venus")).to be_a(Turn)
    expect(@round.turns.count).to eq (2)
    expect(@round.turns.last.feedback).to eq ("Incorrect.")
  end

  it "can return the number of correct guesses" do
    new_turn = @round.take_turn("Juneau")
    expect(new_turn.class).to eq (Turn)
    expect(new_turn.correct?).to eq true
    expect(@round.turns).to eq ([new_turn])
    expect(@round.number_correct).to eq(1)

    expect(@round.current_card).to eq (@card_2)
    expect(@round.take_turn("Venus")).to be_a(Turn)
    expect(@round.turns.count).to eq (2)
    expect(@round.turns.last.feedback).to eq ("Incorrect.")
    expect(@round.number_correct).to eq(1)
  end
end
