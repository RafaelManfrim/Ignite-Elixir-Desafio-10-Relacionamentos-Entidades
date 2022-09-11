defmodule Exmeal.Users.Update do
  alias Exmeal.{Error, Repo, User}

  def call(%{"id" => id} = params) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> update(user, params)
    end
  end

  defp update(user, params) do
    user |> User.changeset(params) |> Repo.update()
  end
end
