defmodule Solar do
  def power(%{classification: :C, scale: scale}), do: scale
  def power(%{classification: :M, scale: scale}), do: scale * 10
  def power(%{classification: :X, scale: scale}), do: scale * 1000

  def no_eva(flares) do
    Enum.filter flares, &(power(&1) > 1000)
  end

  def deadliest(flares) do
    Enum.map(flares, &(power(&1)))
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
