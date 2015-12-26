defmodule Solar.Flare do

  defstruct [
    classification: :M,
    scale: 0,
    power: 0,
    is_deadly: false,
    date: nil
  ]

  def load(flares) do
    for flare <- flares do
      flare
        |> calculate_power
        |> calculate_deadliness
    end
  end

  def power(flare) do
    factor = case flare.classification do
      :M -> 10
      :X -> 1000
      :C -> 1
    end
    flare.scale * factor
  end

  def calculate_power(flare) do
    %{flare | power: power(flare)  }
  end

  def calculate_deadliness(flare) do
    %{ flare | is_deadly: flare.power > 1000}
  end

  def no_eva(flares) do
    Enum.filter flares, &(power(&1) > 1000)
  end

  def deadliest(flares) do
    Enum.map(flares, &(calculate_power(&1)))
      |> Enum.max
  end

  def total_exposure(flares) do
    (for flare <- flares, do: power(flare))
      |> Enum.sum
  end

  def flare_list(flares) do
    for flare <- flares, power <- [power(flare)], is_deadly <- [power > 1000],
    do: %{power: power, is_deadly: is_deadly}
  end

end
