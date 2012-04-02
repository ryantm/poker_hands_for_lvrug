class Card < Struct.new(:rank,:suit)
  include Comparable
  Ordering = (2..10).to_a + [:J, :Q, :K, :A]
  def <=>(other_card)
    Ordering.index(rank) <=> Ordering.index(other_card.rank)
  end
  def to_s
    collect(&:to_s).join # probably better as "#{rank}#{suit}"
  end

  alias old_inspect inspect
  alias inspect to_s
end

class PokerHand < Struct.new(:cards)
  include Comparable
  def <=>(other_hand)
    sorted_cards = cards.sort
    other_sorted_cards = other_hand.cards.sort

    sorted_cards.zip(other_sorted_cards).reverse_each do |card1, card2|
      result = card1 <=> card2
      return result if result != 0
    end
    return 0
  end
end
