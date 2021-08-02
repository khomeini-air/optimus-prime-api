defmodule OptimusPrimeWeb.PrimeControllerTest.Primality do
  use OptimusPrimeWeb.ConnCase
  @endpoint OptimusPrimeWeb.PrimeController
  test "PrimeController - primality of 1" do
    conn = get(build_conn(), :prime?, n: 1)
    assert json_response(conn, 200) == %{"n" => 1, "is_prime" => false}
  end

  test "PrimeController - primality of 3ss" do
    conn = get(build_conn(), :prime?, n: 3)
    assert json_response(conn, 200) == %{"n" => 3, "is_prime" => true}
  end

  test "PrimeController - primality of 5" do
    conn = get(build_conn(), :prime?, n: 5)
    assert json_response(conn, 200) == %{"n" => 5, "is_prime" => true}
  end

  test "PrimeController - primality of 7" do
    conn = get(build_conn(), :prime?, n: 7)
    assert json_response(conn, 200) == %{"n" => 7, "is_prime" => true}
  end

  test "PrimeController - primality of 13" do
    conn = get(build_conn(), :prime?, n: 13)
    assert json_response(conn, 200) == %{"n" => 13, "is_prime" => true}
  end

  test "PrimeController - primality of 14" do
    conn = get(build_conn(), :prime?, n: 14)
    assert json_response(conn, 200) == %{"n" => 14, "is_prime" => false}
  end

  test "PrimeController - primality of 25" do
    conn = get(build_conn(), :prime?, n: 25)
    assert json_response(conn, 200) == %{"n" => 25, "is_prime" => false}
  end

  test "PrimeController - primality of 541" do
    conn = get(build_conn(), :prime?, n: 541)
    assert json_response(conn, 200) == %{"n" => 541, "is_prime" => true}
  end

  test "PrimeController - primality of 555" do
    conn = get(build_conn(), :prime?, n: 555)
    assert json_response(conn, 200) == %{"n" => 555, "is_prime" => false}
  end

  test "PrimeController - primality of 559" do
    conn = get(build_conn(), :prime?, n: 559)
    assert json_response(conn, 200) == %{"n" => 559, "is_prime" => false}
  end

  test "PrimeController - primality of 1980989971" do
    conn = get(build_conn(), :prime?, n: 1_980_989_971)
    assert json_response(conn, 200) == %{"n" => 1_980_989_971, "is_prime" => false}
  end

  @tag timeout: 2000
  test "PrimeController - primality of 965234789658997568954698899" do
    conn = get(build_conn(), :prime?, n: 965_234_789_658_997_568_954_698_899)

    assert json_response(conn, 200) == %{
             "n" => 965_234_789_658_997_568_954_698_899,
             "is_prime" => false
           }
  end

  test "PrimeController - primality of 0" do
    conn = get(build_conn(), :prime?, n: 0)
    assert json_response(conn, 404)["errors"]["detail"] != nil
  end
end
