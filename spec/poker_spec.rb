require_relative 'spec_helper'
require 'poker'

describe Card do
  subject do
    Card.new(:J, :S)
  end

  it 'should have a good to_s' do
    subject.to_s.should == "JS"
  end

  it 'should have a rank' do
    subject.rank.should == :J
  end

  it 'should have a suit' do
    subject.suit.should == :S
  end

  it 'should be have a sort order based on rank' do
    subject.should be > Card[10,:S]
    subject.should be == Card[:J,:H]
    subject.should be < Card[:A,:S]
  end
end

describe PokerHand do
  def test_hands(better_hand,worse_hand)
    better_hand.should be > worse_hand
    worse_hand.should be < better_hand
  end

  it "handle empty hands" do
    PokerHand[[]].should be == PokerHand[[]]
  end

  it "should determine which of the two hands is the better high-card hand" do
    hand = PokerHand[[Card[7,:C], Card[9,:D], Card[:K,:H], Card[:A,:S], Card[2,:C]]]
    other_hand = PokerHand.new([Card[7,:H], Card[9,:C], Card[:K,:S], Card[4,:S], Card[2,:D]])
    test_hands(hand,other_hand)
  end
end
