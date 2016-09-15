defmodule Socket.AddressTest do
  use ExUnit.Case, async: true

  @valid_addresses_strings [{"::1", {0,0,0,0,0,0,0,1}}, {"127.0.0.1", {127,0,0,1}}]
  @valid_addresses_charlists [{'::1', {0,0,0,0,0,0,0,1}}, {'127.0.0.1', {127,0,0,1}}]
  @valid_addresses_tuples [{{0,0,0,0,0,0,0,1}, {0,0,0,0,0,0,0,1}}, {{127,0,0,1}, {127,0,0,1}}]
  @valid_addresses @valid_addresses_charlists ++ @valid_addresses_strings ++ @valid_addresses_tuples

  for {address, resolved} <- @valid_addresses do
    @address address
    @resolved resolved
    test "Valid #{inspect @address} is #{inspect @resolved}", do: assert @resolved = Socket.Address.parse(@address)
    test "#{inspect @address} is valid", do: assert Socket.Address.valid? @address
    if @address |> is_binary do
      test "to_string works with #{inspect @resolved}", do: assert @address = Socket.Address.to_string(@resolved)
      test "to_string on string is id for #{inspect @address}", do: assert @address = Socket.Address.to_string(@address)
    end
    if @address |> is_list do
      test "to_string on char_list converts to string #{inspect @address}", do: assert List.to_string(@address) == Socket.Address.to_string(@address)
    end
  end
end