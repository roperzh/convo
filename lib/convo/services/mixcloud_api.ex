defmodule Convo.Services.MixcloudApi do
  @http Application.get_env(:convo, :http)
  @base_url "https://api.mixcloud.com/"

  def upload_mp3!(mp3, name, token) do
    url = "#{@base_url}upload/?access_token=#{token}"
    options = [hackney: [:insecure], timeout: 999_999_999]
    body = {
      :multipart,
      [{"mp3", mp3, {["form-data"],
        [name: "\"mp3\"", filename: "\"#{name}\""]},[]},
      {"name", name}]
    }

    @http.post!(url, body, [], options)
  end
end