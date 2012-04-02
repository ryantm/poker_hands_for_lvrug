require_relative 'spec_helper'
require 'poker'
# Poker Hands are described as an array of 5 Cards.
# Cards are described by their Rank and Suit using 2 characters.
# Example: %w[ 7C 9D KH AS 2C ]
# A Card is greater than another card if it's Rank is greater.
# %w[ 2 3 4 5 6 7 8 9 T J Q K A ]
# The Poker Hand Evaluator should take two hands and declare which is the winner.
# Along with identifying the winner it should identify what type of hand.

# Poker Rankings from worst to best are:
# High card         %w[ 7C 9D KH AS 2C ]
# One Pair          %w[ 7C 7D KH AS 2C ]
# Two Pair          %w[ 7C 7D KH KS 2C ]
# Three of a Kind   %w[ 7C 7D 7H AS 2C ]
# Straight          %w[ 7C 8D 9H TS JC ]
# Flush             %w[ 7C 9C KC AC 2C ]
# Full House        %w[ 7C 7D 7H AS AC ]
# Straight Flush    %w[ 7C 8C 9C TC JC ]

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

  it 'should be have a sort order' do
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

  before :each do
    # @evaluator = PokerHand.new
    # @high_card1 = %w[ 7C 9D KH AS 2C ]
    # @high_card2 = %w[ 7H 9C KS 4S 2D ]
    # @pair1 = %w[ 7C 7D KH AS 2C ]
    # @pair2 = %w[ 8C 8D KS AH 2D ]
    # @two_pair1 = %w[ 7C 7D KH KS 2C ]
    # @two_pair2 = %w[ 7H 7S JH JS 2D ]
    # @three_of_kind1 = %w[ 7C 7D 7H AS 2C ]
    # @three_of_kind2 = %w[ TC TD TH AH 2D ]
    # @straight1 = %w[ 7C 8D 9H TS JC ]
    # @straight2 = %w[ 3C 4D 5H 6S 7D ]
    # @flush1 = %w[ 7C 9C KC AC 2C ]
    # @flush2 = %w[ 7H 9H KH 4H 2H ]
    # @full_house1 = %w[ 7C 7D 7H AS AC ]
    # @full_house2 = %w[ 5C 5D 5H JS JC ]
    # @straight_flush1 = %w[ 7C 8C 9C TC JC ]
    # @straight_flush2 = %w[ 3D 4D 5D 6D 7D ]
  end

end
