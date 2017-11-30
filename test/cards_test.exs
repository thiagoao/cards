defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 52 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 52
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck)
  end

  test "dealing a hand remove cards from the deck" do
    deck = Cards.create_deck
    {hand, deck} = Cards.deal(deck, 5)
    assert length(hand) == 5
    assert length(deck) == 47
  end
end
