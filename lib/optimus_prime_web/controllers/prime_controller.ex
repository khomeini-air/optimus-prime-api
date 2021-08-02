defmodule OptimusPrimeWeb.PrimeController do
  use OptimusPrimeWeb, :controller

  alias OptimusPrime.Prime.PrimalityChecker
  alias OptimusPrime.Prime.PrimeFinder
  alias OptimusPrime.Prime.PrimeFactor

  @doc """
  controller for primality API.
  """
  def prime?(conn, param) do
    changeset = Params.Prime.changeset(param)

    if changeset.valid? do
      %{n: n} = changeset.changes
      is_prime = PrimalityChecker.prime?(n)

      conn
      |> put_status(:ok)
      |> put_view(OptimusPrimeWeb.PrimeView)
      |> render("primality.json", %{result: %{n: n, is_prime: is_prime}})
    else
      conn
      |> put_status(:not_found)
      |> put_view(OptimusPrimeWeb.ErrorView)
      |> render("404.json", message: "not found")
    end
  end

  @doc """
  controller for prime_factor API.
  """
  def prime_factor(conn, param) do
    changeset = Params.Prime.changeset(param)

    if changeset.valid? do
      %{n: n} = changeset.changes
      prime_factor = PrimeFactor.factors_for(n)

      conn
      |> put_status(:ok)
      |> put_view(OptimusPrimeWeb.PrimeView)
      |> render("prime_factor.json", %{result: %{n: n, prime_factor: prime_factor}})
    else
      conn
      |> put_status(:not_found)
      |> put_view(OptimusPrimeWeb.ErrorView)
      |> render("404.json", message: "not found")
    end
  end

  @doc """
  controller for prime_lte (less than equal) API
  """
  def prime_lte(conn, param) do
    changeset = Params.Prime.Paging.changeset(param)

    if changeset.valid? do
      %{n: n, limit: limit, offset: offset} = changeset.changes
      prime_lte = PrimeFinder.prime_lte(n, limit, offset)

      conn
      |> put_status(:ok)
      |> put_view(OptimusPrimeWeb.PrimeView)
      |> render("prime_lte.json", %{result: %{n: n, limit: limit, offset: offset, prime_lte: prime_lte}})
    else
      conn
      |> put_status(:bad_request)
      |> put_view(OptimusPrimeWeb.ErrorView)
      |> render("400.json", messages: "invalid request parameter: #{(elem(Enum.at(changeset.errors, 0), 0))}")
    end
  end
end
