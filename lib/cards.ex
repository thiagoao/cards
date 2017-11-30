defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  @doc """
    Returns a list of string representing a deck of playing cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Receive a list of string presenting a deck of playing cards.
    Returns a unsorted list of string.
  """
  def shuffle(deck) do
    Enum.shuffle deck
  end

  @doc """
    Returns true or false if the card choose is in the deck
  """
  def contains?(deck, card) do
    Enum.member? deck, card
  end

  @doc """
    Divides a deck into a hand and the remainder fo the deck.
    The `hand_size` argument indicates how many cards should
    be in the hand.

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split deck, hand_size
  end

  @doc """
    Save a list of string to a specific path as binary
  """
  def save(cards, filename) do
    binary = :erlang.term_to_binary(cards)
    File.write filename, binary
  end

  @doc """
    Load a binary file from a specific path and returns
    a list of strings.
  """
  def load(filename) do
    case File.read filename do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exist"
    end
  end

  @doc """
    Creates a list of string representing a deck of playing cards.
    Shuffle it, ivides a deck into a hand and the remainder fo the deck.
    The `hand_size` argument indicates how many cards should
    be in the hand.
  """
  def create_hand(hand_size) do
    Cards.create_deck |> Cards.shuffle |> Cards.deal(hand_size)
  end
end
