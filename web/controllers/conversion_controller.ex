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
    |> put_flash(:info, "Your audio is getting uploaded!, Please check your provider profile")
    |> render("success.html", changeset: %Conversion{})
  end

  def create(conn, %{"conversion" => %{"video_url" => video_url}}) do
    token = get_session(conn, :access_token)

    Task.Supervisor.start_child Convo.MP3Uploader, fn ->
      :timer.sleep(10000)

      video_info =
        video_url
        |> URI.parse
        |> Map.get(:query)
        |> URI.decode_query
        |> Map.get("v")
        |> Youtube.get_mp3_info!

      video_info
      |> Map.get(:link)
      |> Youtube.download_mp3!
      |> MixcloudApi.upload_mp3!(video_info.name, token)
    end

    redirect(conn, to: conversion_path(conn, :success))
  end
end
