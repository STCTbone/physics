defmodule RocketryTest do
  use ExUnit.Case
  doctest Physics.Rocketry

  test "escape_velocity(:earth)" do
    assert Physics.Rocketry.escape_velocity(:earth) == 11.2
  end

  test "escape_velocity(:mars)" do
    assert Physics.Rocketry.escape_velocity(:mars) == 5.1
  end

  test "escape_velocity(:moon)" do
    assert Physics.Rocketry.escape_velocity(:moon) == 2.4
  end

  test "escape_velocity(%{mass, radius})" do
    assert(Physics.Rocketry.escape_velocity(%{mass: 1.2e70, radius: 1.2e6})
     == 1.1549891774384728e24)
  end

  test "orbital_acceleration" do
    assert Physics.Rocketry.orbital_acceleration(100) == 9.515619587729839
  end

  test "orbital_term" do
    assert Physics.Rocketry.orbital_term(100) == 1.4391662709630206
  end

  test "height_for_term" do
    assert Physics.Rocketry.height_for_term(4) ==  6419.992608113231
  end
end
