defmodule Catalogry.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Catalogry.Repo

  alias Catalogry.Accounts.Authenticator

  @doc """
  Returns the list of authenticators.

  ## Examples

      iex> list_authenticators()
      [%Authenticator{}, ...]

  """
  def list_authenticators do
    Repo.all(Authenticator)
  end

  @doc """
  Gets a single authenticator.

  Raises `Ecto.NoResultsError` if the Authenticator does not exist.

  ## Examples

      iex> get_authenticator!(123)
      %Authenticator{}

      iex> get_authenticator!(456)
      ** (Ecto.NoResultsError)

  """
  def get_authenticator!(id), do: Repo.get!(Authenticator, id)

  @doc """
  Creates a authenticator.

  ## Examples

      iex> create_authenticator(%{field: value})
      {:ok, %Authenticator{}}

      iex> create_authenticator(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_authenticator(attrs \\ %{}) do
    %Authenticator{}
    |> Authenticator.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a authenticator.

  ## Examples

      iex> update_authenticator(authenticator, %{field: new_value})
      {:ok, %Authenticator{}}

      iex> update_authenticator(authenticator, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_authenticator(%Authenticator{} = authenticator, attrs) do
    authenticator
    |> Authenticator.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Authenticator.

  ## Examples

      iex> delete_authenticator(authenticator)
      {:ok, %Authenticator{}}

      iex> delete_authenticator(authenticator)
      {:error, %Ecto.Changeset{}}

  """
  def delete_authenticator(%Authenticator{} = authenticator) do
    Repo.delete(authenticator)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking authenticator changes.

  ## Examples

      iex> change_authenticator(authenticator)
      %Ecto.Changeset{source: %Authenticator{}}

  """
  def change_authenticator(%Authenticator{} = authenticator) do
    Authenticator.changeset(authenticator, %{})
  end
end
