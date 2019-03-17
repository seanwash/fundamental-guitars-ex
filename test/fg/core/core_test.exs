defmodule Fg.CoreTest do
  use Fg.DataCase

  alias Fg.Core

  describe "exercises" do
    alias Fg.Core.Exercise

    @valid_attrs %{body: "some body", description: "some description", duration: 42, slug: "some slug", source: "some source", title: "some title"}
    @update_attrs %{body: "some updated body", description: "some updated description", duration: 43, slug: "some updated slug", source: "some updated source", title: "some updated title"}
    @invalid_attrs %{body: nil, description: nil, duration: nil, slug: nil, source: nil, title: nil}

    def exercise_fixture(attrs \\ %{}) do
      {:ok, exercise} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Core.create_exercise()

      exercise
    end

    test "list_exercises/0 returns all exercises" do
      exercise = exercise_fixture()
      assert Core.list_exercises() == [exercise]
    end

    test "get_exercise!/1 returns the exercise with given id" do
      exercise = exercise_fixture()
      assert Core.get_exercise!(exercise.id) == exercise
    end

    test "create_exercise/1 with valid data creates a exercise" do
      assert {:ok, %Exercise{} = exercise} = Core.create_exercise(@valid_attrs)
      assert exercise.body == "some body"
      assert exercise.description == "some description"
      assert exercise.duration == 42
      assert exercise.slug == "some slug"
      assert exercise.source == "some source"
      assert exercise.title == "some title"
    end

    test "create_exercise/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_exercise(@invalid_attrs)
    end

    test "update_exercise/2 with valid data updates the exercise" do
      exercise = exercise_fixture()
      assert {:ok, %Exercise{} = exercise} = Core.update_exercise(exercise, @update_attrs)
      assert exercise.body == "some updated body"
      assert exercise.description == "some updated description"
      assert exercise.duration == 43
      assert exercise.slug == "some updated slug"
      assert exercise.source == "some updated source"
      assert exercise.title == "some updated title"
    end

    test "update_exercise/2 with invalid data returns error changeset" do
      exercise = exercise_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_exercise(exercise, @invalid_attrs)
      assert exercise == Core.get_exercise!(exercise.id)
    end

    test "delete_exercise/1 deletes the exercise" do
      exercise = exercise_fixture()
      assert {:ok, %Exercise{}} = Core.delete_exercise(exercise)
      assert_raise Ecto.NoResultsError, fn -> Core.get_exercise!(exercise.id) end
    end

    test "change_exercise/1 returns a exercise changeset" do
      exercise = exercise_fixture()
      assert %Ecto.Changeset{} = Core.change_exercise(exercise)
    end
  end

  describe "tags" do
    alias Fg.Core.Tag

    @valid_attrs %{slug: "some slug", title: "some title"}
    @update_attrs %{slug: "some updated slug", title: "some updated title"}
    @invalid_attrs %{slug: nil, title: nil}

    def tag_fixture(attrs \\ %{}) do
      {:ok, tag} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Core.create_tag()

      tag
    end

    test "list_tags/0 returns all tags" do
      tag = tag_fixture()
      assert Core.list_tags() == [tag]
    end

    test "get_tag!/1 returns the tag with given id" do
      tag = tag_fixture()
      assert Core.get_tag!(tag.id) == tag
    end

    test "create_tag/1 with valid data creates a tag" do
      assert {:ok, %Tag{} = tag} = Core.create_tag(@valid_attrs)
      assert tag.slug == "some slug"
      assert tag.title == "some title"
    end

    test "create_tag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_tag(@invalid_attrs)
    end

    test "update_tag/2 with valid data updates the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{} = tag} = Core.update_tag(tag, @update_attrs)
      assert tag.slug == "some updated slug"
      assert tag.title == "some updated title"
    end

    test "update_tag/2 with invalid data returns error changeset" do
      tag = tag_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_tag(tag, @invalid_attrs)
      assert tag == Core.get_tag!(tag.id)
    end

    test "delete_tag/1 deletes the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{}} = Core.delete_tag(tag)
      assert_raise Ecto.NoResultsError, fn -> Core.get_tag!(tag.id) end
    end

    test "change_tag/1 returns a tag changeset" do
      tag = tag_fixture()
      assert %Ecto.Changeset{} = Core.change_tag(tag)
    end
  end
end
