ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Swolen.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Swolen.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Swolen.Repo)

