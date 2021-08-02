defmodule OptimusPrime.Prime.PrimeFinder do
  @doc """
  find primes that less or equal to n from start_index with amount of elements.
  Example: prime_lte(10, 1, 2) returns [3,5]
  """
  def prime_lte(n, index, amount) do
    range_size = get_range_size(n)

    root_prime = sieve_prime(Enum.to_list(2..range_size), index + amount, [])

    if length(root_prime) == index + amount do
      Enum.slice(root_prime, index, amount)
    else
      sieve_result = sieve_segmented(n, range_size,  index + amount, root_prime, root_prime)
      Enum.slice(sieve_result, index, amount)
    end
  end

  defp get_range_size(n) do
    round(:math.sqrt(n))
  end

  defp sieve_segmented(_n, _segment_start, target_length, _root_prime, acc) when length(acc) > target_length do
    acc
  end

  defp sieve_segmented(n, segment_start, _target_length, _root_prime, acc) when segment_start >= n do
    acc
  end

  defp sieve_segmented(n, segment_start, target_length, root_prime, acc) do
    next_segment_start = segment_start + get_range_size(n)
    segment = compute_segment(n, segment_start, next_segment_start)

    sieve_segmented(
      n,
      next_segment_start,
      target_length,
      root_prime,
      acc ++ sieve_root_prime(segment, root_prime)
    )
  end

  defp compute_segment(n, segment_start, next_segment_start) do
    if next_segment_start < n do
      Enum.to_list((segment_start + 1)..next_segment_start)
    else
      Enum.to_list((segment_start + 1)..n)
    end
  end

  defp sieve_root_prime(segment, []) do
    segment
  end

  defp sieve_root_prime(segment, [head | tail]) do
    segment
    |> Enum.filter(&(rem(&1, head) != 0))
    |> sieve_root_prime(tail)
  end

  defp sieve_prime(range, target_length, acc) do
    range
    |> sieve_prime_recursion(target_length, acc)
  end

  defp sieve_prime_recursion(_target, target_length, acc)
       when length(acc) > target_length do
    acc
  end

  defp sieve_prime_recursion([], _target_length, acc) do
    acc
  end

  defp sieve_prime_recursion([head | tail], target_length, acc) do
    tail
    |> Enum.filter(&(rem(&1, head) != 0))
    |> sieve_prime_recursion(target_length, acc ++ [head])
  end
end
