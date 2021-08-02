defmodule OptimusPrime.Prime.PrimeFactor do
  @doc """
  Compute the prime factors for an integer n.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The result will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(number) do
    {final_number_2, acc_2} = factor(number, 2, [])

    {final_number, acc_final} =
      3..trunc(:math.sqrt(final_number_2))//2
      |> Enum.to_list()
      |> Enum.reduce({final_number_2, acc_2}, fn n, {num, acc} -> factor(num, n, acc) end)

    if final_number > 2 do
      acc_final ++ [final_number]
    else
      acc_final
    end
  end

  defp factor(number, n, acc) do
    if rem(number, n) == 0 do
      factor(div(number, n), n, acc ++ [n])
    else
      {number, acc}
    end
  end
end
