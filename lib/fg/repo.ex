defmodule Fg.Repo do
  use Ecto.Repo,
    otp_app: :fg,
    adapter: Ecto.Adapters.Postgres
end
