defmodule RocketryTest do
  use ExUnit.Case
  doctest Physics.Rocketry

  test "escape_velocity(:earth)" do
    assert Physics.Rocketry.escape_velocity(:earth) == 11.2
  end

  test "escape_velocity(%{mass, radius})" do
    assert(Physics.Rocketry.escape_velocity(%{mass: 1.2e70, radius: 1.2e6})
     == 1.1549891774384728e24)
  end
end
