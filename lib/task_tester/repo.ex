defmodule TaskTester.Repo do
  use Ecto.Repo,
    otp_app: :task_tester,
    adapter: Ecto.Adapters.Postgres
end
