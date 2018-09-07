defmodule BasicsWeb.ProfileView do
  use BasicsWeb, :view
  alias PhoenixBasicsWeb.Uploaders.Image, as: ArcImage

  def profile_image(profile) do
    ArcImage.url({profile.image, profile})
  end
end
