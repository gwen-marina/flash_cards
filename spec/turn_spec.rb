require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  before :each do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  it "exists" do
    expect(@turn).to be_a(Turn)
  end

  it "has attributes" do
    expect(@turn.card).to eq(@card)
  end

  it "can guess the correct answer" do
    expect(@turn.card).to eq(@card)
    expect(@turn.guess).to eq("Juneau")
    expect(@turn.correct?).to eq(true)
  end

  it "text" do

  end

end
