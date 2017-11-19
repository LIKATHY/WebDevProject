# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Mangalike.Repo.insert!(%Mangalike.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Mangalike.Repo
alias Mangalike.Accounts.User

Repo.delete_all(User)

Repo.insert!(%User{name: "Admin", username: "Admin", email: "admin@admin.com", is_admin?: true})
