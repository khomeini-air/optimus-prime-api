defmodule OptimusPrime.Prime.PrimalityChecker do
  def prime?(n) when n <= 3 do
    case n do
      1 -> false
      2 -> true
      3 -> true
    end
  end

  def prime?(n) when rem(n, 2) == 0 or rem(n, 3) == 0 do
    false
  end

  @doc """
  primality check for an integer n.

  return true if n is prime and false otherwise.
  """
  def prime?(n) when n >= 5 do
    5..trunc(:math.sqrt(n))//6
    |> Enum.to_list()
    |> Enum.reduce_while(true, fn i, _acc ->
      if rem(n, i) == 0 || rem(n, i + 2) == 0,
        do: {:halt, false},
        else: {:cont, true}
    end)
  end
end
