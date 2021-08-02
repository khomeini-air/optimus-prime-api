defmodule OptimusPrimeWeb.PrimeControllerTest.PrimeFinder do
  use OptimusPrimeWeb.ConnCase
  @endpoint OptimusPrimeWeb.PrimeController

  test "PrimeController - prime less than equal 2, limit: 0, offset: 1" do
    conn = get(build_conn(), :prime_lte, n: 2, limit: 0, offset: 1)
    assert json_response(conn, 200) == %{"n" => 2, "prime_lte" => [2], "limit" => 0, "offset" => 1 }
  end

  test "PrimeController - prime less than equal 3, limit: 0, offset: 2" do
    conn = get(build_conn(), :prime_lte, n: 3, limit: 0, offset: 2)
    assert json_response(conn, 200) == %{"n" => 3, "prime_lte" => [2, 3], "limit" => 0, "offset" => 2 }
  end

  test "PrimeController - prime less than equal 5, limit: 0, offset: 3" do
    conn = get(build_conn(), :prime_lte, n: 5, limit: 0, offset: 3)
    assert json_response(conn, 200) == %{"n" => 5, "prime_lte" => [2, 3, 5], "limit" => 0, "offset" => 3}
  end

  test "PrimeController - prime less than equal 227" do
    conn = get(build_conn(), :prime_lte, n: 227, limit: 0, offset: 49)

    assert json_response(conn, 200) == %{
             "n" => 227,
             "prime_lte" => [
               2,
               3,
               5,
               7,
               11,
               13,
               17,
               19,
               23,
               29,
               31,
               37,
               41,
               43,
               47,
               53,
               59,
               61,
               67,
               71,
               73,
               79,
               83,
               89,
               97,
               101,
               103,
               107,
               109,
               113,
               127,
               131,
               137,
               139,
               149,
               151,
               157,
               163,
               167,
               173,
               179,
               181,
               191,
               193,
               197,
               199,
               211,
               223,
               227
             ], "limit" => 0, "offset" => 49
           }
  end

  test "PrimeController - prime less than equal 1_000_000, limit: 0, offset: 3" do
    conn = get(build_conn(), :prime_lte, n: 1_000_000, limit: 0, offset: 3)
    assert json_response(conn, 200) == %{"n" => 1_000_000, "prime_lte" => [2, 3, 5], "limit" => 0, "offset" => 3}
  end

  test "PrimeController - prime less than equal 0" do
    conn = get(build_conn(), :prime_lte, n: 0, limit: 0, offset: 1)
    assert json_response(conn, 400)["errors"]["detail"] != nil
  end

  test "PrimeController - prime less than equal 10, limit: a" do
    conn = get(build_conn(), :prime_lte, n: 10, limit: "a", offset: 1)
    assert json_response(conn, 400)["errors"]["detail"] != nil
  end

  test "PrimeController - prime less than equal 1000, offset: 101" do
    conn = get(build_conn(), :prime_lte, n: 1000, limit: 0, offset: 101)
    assert json_response(conn, 400)["errors"]["detail"] != nil
  end
end
