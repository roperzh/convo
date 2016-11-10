defmodule Convo.ConversionController do
  use Convo.Web, :controller

  alias Convo.Services.{MixcloudApi, Youtube}
  alias Convo.Models.Conversion

  def index(conn, params) do
    new(conn, params)
  end

  def new(conn, _params) do
    conn
    |> render("new.html", changeset: %Conversion{})
  end

  def success(conn, _params) do
    conn
    |> render("success.html", changeset: %Conversion{})
  end

  def create(conn, %{"conversion" => %{"video_id" => video_id, "name" => name}}) do
    token = get_session(conn, :access_token)

    Task.start(
      fn ->
        video_id
        |> Youtube.download_mp3!
        |> MixcloudApi.upload_mp3!(name, token)
        |> Map.get(:body)
        |> Poison.decode!
      end
    )

    redirect(conn, to: conversion_path(conn, :success))
  end
end
