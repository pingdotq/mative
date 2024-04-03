defmodule Mative.Repo do
  use Ecto.Repo,
    otp_app: :mative,
    adapter: Ecto.Adapters.Postgres
end
