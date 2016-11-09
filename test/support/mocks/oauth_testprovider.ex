defmodule Oauth.Testprovider do
  def authorize_url! do
    "/test-url"
  end

  def get_token!(_params \\ [], _headers \\ []) do
    %{
      token: %{
        access_token: "test-token"
      }
    }
  end
end