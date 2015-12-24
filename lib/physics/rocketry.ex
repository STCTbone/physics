
defmodule Physics.Rocketry do
  import Calcs
  import Physics.Laws
  import Planets

  def escape_velocity(:earth) do
    earth
      |> escape_velocity
  end

  def escape_velocity(:mars) do
    mars
      |> escape_velocity
  end

  def escape_velocity(:moon) do
    moon
      |> escape_velocity
  end

  def escape_velocity(planet) when is_map(planet) do
    planet
      |> calculate_escape
      |> to_km
      |> to_nearest_tenth
  end

  def height_for_term(term_hrs), do: height_for_term(:earth, term_hrs)
  def height_for_term(:earth, term_hrs), do: height_for_term(earth, term_hrs)
  def height_for_term(:mars, term_hrs), do: height_for_term(mars, term_hrs)
  def height_for_term(:moon, term_hrs), do: height_for_term(moon, term_hrs)

  def height_for_term(planet, term_hrs) do
    term_seconds = term_hrs * 60 * 60
    total_radius = newtons_gravitational_constant * earth.mass * (term_seconds |> squared) / (4 * (pi |> squared))
      |> cube_root
    total_radius - earth.radius
      |> to_km
  end

  def orbital_acceleration(height), do: orbital_acceleration(:earth, height)
  def orbital_acceleration(:earth, height), do: orbital_acceleration(earth, height)
  def orbital_acceleration(:mars, height), do: orbital_acceleration(mars, height)
  def orbital_acceleration(:moon, height), do: orbital_acceleration(moon, height)

  def orbital_acceleration(planet, height) do
    (orbital_speed(planet, height) |> squared) / orbital_radius(planet, height)
  end

  def orbital_speed(height), do: orbital_speed(:earth, height)
  def orbital_speed(:earth, height), do: orbital_speed(earth, height)
  def orbital_speed(:mars, height), do: orbital_speed(mars, height)
  def orbital_speed(:moon, height), do: orbital_speed(moon, height)

  def orbital_speed(planet, height) do
    newtons_gravitational_constant * planet.mass / orbital_radius(height)
      |> square_root
  end

  def orbital_term(height) do
    4 * (pi |> squared) * (orbital_radius(height) |> cubed) / (newtons_gravitational_constant * earth.mass)
      |> square_root
      |> seconds_to_hours
  end

  defp calculate_escape(%{mass: mass, radius: radius}) do
    2 * newtons_gravitational_constant * mass / radius
      |> square_root
  end

  defp orbital_radius(height), do: orbital_radius(:earth, height)
  defp orbital_radius(:earth, height), do: orbital_radius(earth, height)
  defp orbital_radius(:mars, height), do: orbital_radius(mars, height)
  defp orbital_radius(:moon, height), do: orbital_radius(moon,height)

  defp orbital_radius(planet, height) do
    planet.radius + (height |> to_m)
  end
end
