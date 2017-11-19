defmodule Mangalike.MangaTest do
  use Mangalike.DataCase

  alias Mangalike.Manga

  describe "series" do
    alias Mangalike.Manga.Serie

    @valid_attrs %{title: "some title"}
    @update_attrs %{title: "some updated title"}
    @invalid_attrs %{title: nil}

    def serie_fixture(attrs \\ %{}) do
      {:ok, serie} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Manga.create_serie()

      serie
    end

    test "list_series/0 returns all series" do
      serie = serie_fixture()
      assert Manga.list_series() == [serie]
    end

    test "get_serie!/1 returns the serie with given id" do
      serie = serie_fixture()
      assert Manga.get_serie!(serie.id) == serie
    end

    test "create_serie/1 with valid data creates a serie" do
      assert {:ok, %Serie{} = serie} = Manga.create_serie(@valid_attrs)
      assert serie.title == "some title"
    end

    test "create_serie/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Manga.create_serie(@invalid_attrs)
    end

    test "update_serie/2 with valid data updates the serie" do
      serie = serie_fixture()
      assert {:ok, serie} = Manga.update_serie(serie, @update_attrs)
      assert %Serie{} = serie
      assert serie.title == "some updated title"
    end

    test "update_serie/2 with invalid data returns error changeset" do
      serie = serie_fixture()
      assert {:error, %Ecto.Changeset{}} = Manga.update_serie(serie, @invalid_attrs)
      assert serie == Manga.get_serie!(serie.id)
    end

    test "delete_serie/1 deletes the serie" do
      serie = serie_fixture()
      assert {:ok, %Serie{}} = Manga.delete_serie(serie)
      assert_raise Ecto.NoResultsError, fn -> Manga.get_serie!(serie.id) end
    end

    test "change_serie/1 returns a serie changeset" do
      serie = serie_fixture()
      assert %Ecto.Changeset{} = Manga.change_serie(serie)
    end
  end

  describe "chats" do
    alias Mangalike.Manga.Chat

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def chat_fixture(attrs \\ %{}) do
      {:ok, chat} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Manga.create_chat()

      chat
    end

    test "list_chats/0 returns all chats" do
      chat = chat_fixture()
      assert Manga.list_chats() == [chat]
    end

    test "get_chat!/1 returns the chat with given id" do
      chat = chat_fixture()
      assert Manga.get_chat!(chat.id) == chat
    end

    test "create_chat/1 with valid data creates a chat" do
      assert {:ok, %Chat{} = chat} = Manga.create_chat(@valid_attrs)
      assert chat.name == "some name"
    end

    test "create_chat/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Manga.create_chat(@invalid_attrs)
    end

    test "update_chat/2 with valid data updates the chat" do
      chat = chat_fixture()
      assert {:ok, chat} = Manga.update_chat(chat, @update_attrs)
      assert %Chat{} = chat
      assert chat.name == "some updated name"
    end

    test "update_chat/2 with invalid data returns error changeset" do
      chat = chat_fixture()
      assert {:error, %Ecto.Changeset{}} = Manga.update_chat(chat, @invalid_attrs)
      assert chat == Manga.get_chat!(chat.id)
    end

    test "delete_chat/1 deletes the chat" do
      chat = chat_fixture()
      assert {:ok, %Chat{}} = Manga.delete_chat(chat)
      assert_raise Ecto.NoResultsError, fn -> Manga.get_chat!(chat.id) end
    end

    test "change_chat/1 returns a chat changeset" do
      chat = chat_fixture()
      assert %Ecto.Changeset{} = Manga.change_chat(chat)
    end
  end
end
