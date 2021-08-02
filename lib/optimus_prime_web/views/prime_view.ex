defmodule OptimusPrimeWeb.PrimeView do
  use OptimusPrimeWeb, :view

  def render("primality.json", %{result: result}) do
    %{n: result.n, is_prime: result.is_prime}
  end

  def render("prime_factor.json", %{result: result}) do
    %{n: result.n, prime_factor: result.prime_factor}
  end

  def render("prime_lte.json", %{result: result}) do
    %{n: result.n, limit: result.limit, offset: result.offset, prime_lte: result.prime_lte}
  end
end
