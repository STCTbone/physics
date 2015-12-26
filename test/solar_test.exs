defmodule SolarTest do
  use ExUnit.Case, async: true
  use Timex

  setup do
    flares = [
      %{classification: :X, scale: 99, date: Date.from({1859, 8, 29})},
      %{classification: :M, scale: 5.8, date: Date.from({2015, 1, 12})},
      %{classification: :M, scale: 1.2, date: Date.from({2015, 2, 9})},
      %{classification: :C, scale: 3.2, date: Date.from({2015, 4, 18})},
      %{classification: :M, scale: 83.6, date: Date.from({2015, 6, 23})},
      %{classification: :C, scale: 2.5, date: Date.from({2015, 7, 4})},
      %{classification: :X, scale: 72, date: Date.from({2012, 7,23})},
      %{classification: :X, scale: 45, date: Date.from({2003, 11, 4})}
    ]
    {:ok, data: flares}
  end

  test "we have 8 solar flares", %{data: flares} do
    assert length(flares) == 8
  end

  test "power/2 calculates the correct result for C classification", %{data: flares} do
    test_flare = Enum.at(flares, 3)
    assert Solar.power(test_flare) == 3.2
  end

  test "power/2 calculates the correct result for M classification", %{data: flares} do
    test_flare = Enum.at(flares, 2)
    assert Solar.power(test_flare) == 12
  end

  test "power/2 calculates the correct result for X classification", %{data: flares} do
    test_flare = Enum.at(flares, 0)
    assert Solar.power(test_flare) == 99 * 1000
  end

  test "Go inside", %{data: flares} do
    d = Solar.no_eva(flares)
    assert length(d) == 3
  end

  test "deadliest/1", %{data: flares} do
    assert Solar.deadliest(flares) == 99 * 1000
  end

  test "total_exposure/1", %{data: flares} do
    assert Solar.total_exposure(flares) == 99 * 1000 + 5.8 * 10 + 1.2 * 10 + 3.2 + 83.6 * 10 + 2.5 + 72 * 1000 + 45 * 1000
  end

  test "A list of flares", %{data: flares} do
    result = Solar.flare_list(flares)
    assert result == [
      %{power: 99000, is_deadly: true},
      %{power: 58.0, is_deadly: false},
      %{power: 12.0, is_deadly: false},
      %{power: 3.2, is_deadly: false},
      %{power: 836.0, is_deadly: false},
      %{power: 2.5, is_deadly: false},
      %{power: 72000, is_deadly: true},
      %{power: 45000, is_deadly: true}
    ]
  end
end
