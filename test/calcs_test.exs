defmodule CalcsTest do
  use ExUnit.Case
  doctest Calcs

  test "cube_root" do
    assert Calcs.cube_root(2) == 1.2599210498948732
  end
end
