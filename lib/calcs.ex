defmodule Calcs do
  def cube_root(val) do
    :math.pow(val, 1.0/3)
  end

  def cubed(val) do
    val * val * val
  end

  def pi do
    :math.pi
  end

  def to_nearest_tenth(val) do
    Float.ceil(val, 1)
  end

  def to_m(velocity) do
    velocity * 1000
  end

  def to_km(velocity) do
    velocity / 1000
  end

  def seconds_to_hours(seconds) do
    seconds / 60 / 60
  end

  def square_root(val) do
    :math.sqrt(val)
  end

  def squared(val) do
    val * val
  end
end
