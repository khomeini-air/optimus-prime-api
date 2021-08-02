defmodule OptimusPrimeWeb.PrimeControllerTest.PrimeFactor do
  use OptimusPrimeWeb.ConnCase
  @endpoint OptimusPrimeWeb.PrimeController

  test "PrimeController - prime factor for 1" do
    conn = get(build_conn(), :prime_factor, n: 1)
    assert json_response(conn, 200) == %{"n" => 1, "prime_factor" => []}
  end

  test "PrimeController - prime factor for 2" do
    conn = get(build_conn(), :prime_factor, n: 2)
    assert json_response(conn, 200) == %{"n" => 2, "prime_factor" => [2]}
  end

  test "PrimeController - prime factor for 3" do
    conn = get(build_conn(), :prime_factor, n: 3)
    assert json_response(conn, 200) == %{"n" => 3, "prime_factor" => [3]}
  end

  test "PrimeController - prime factor for 4" do
    conn = get(build_conn(), :prime_factor, n: 4)
    assert json_response(conn, 200) == %{"n" => 4, "prime_factor" => [2, 2]}
  end

  test "PrimeController - prime factor for 6" do
    conn = get(build_conn(), :prime_factor, n: 6)
    assert json_response(conn, 200) == %{"n" => 6, "prime_factor" => [2, 3]}
  end

  test "PrimeController - prime factor for 8" do
    conn = get(build_conn(), :prime_factor, n: 8)
    assert json_response(conn, 200) == %{"n" => 8, "prime_factor" => [2, 2, 2]}
  end

  test "PrimeController - prime factor for 9" do
    conn = get(build_conn(), :prime_factor, n: 9)
    assert json_response(conn, 200) == %{"n" => 9, "prime_factor" => [3, 3]}
  end

  test "PrimeController - prime factor for 27" do
    conn = get(build_conn(), :prime_factor, n: 27)
    assert json_response(conn, 200) == %{"n" => 27, "prime_factor" => [3, 3, 3]}
  end

  test "PrimeController - prime factor for 625" do
    conn = get(build_conn(), :prime_factor, n: 625)
    assert json_response(conn, 200) == %{"n" => 625, "prime_factor" => [5, 5, 5, 5]}
  end

  test "PrimeController - prime factor for 901255" do
    conn = get(build_conn(), :prime_factor, n: 901_255)
    assert json_response(conn, 200) == %{"n" => 901_255, "prime_factor" => [5, 17, 23, 461]}
  end

  test "PrimeController - prime factor for 93819012551" do
    conn = get(build_conn(), :prime_factor, n: 93_819_012_551)

    assert json_response(conn, 200) == %{
             "n" => 93_819_012_551,
             "prime_factor" => [11, 9539, 894_119]
           }
  end

  @tag timeout: 1000
  test "PrimeController - prime factor for 10000000055" do
    conn = get(build_conn(), :prime_factor, n: 10_000_000_055)

    assert json_response(conn, 200) == %{
             "n" => 10_000_000_055,
             "prime_factor" => [5, 2_000_000_011]
           }
  end
end
