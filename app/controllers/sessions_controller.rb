class SessionsController < ApplicationController
  def create
    auth     = request.env["omniauth.auth"]
    provider = auth["provider"]
    uid      = auth["uid"]

    if user = User.find_by_provider_and_uid(provider, uid)
      self.current_user = user
      redirect_to :back
      return
    end

    user = User.new({
      :provider          => provider,
      :uid               => uid,
      :name              => auth["user_info"]["nickname"],
      :profile_image_url => auth["user_info"]["image"],
      :access_token      => auth["credentials"]["token"],
      :access_secret     => auth["credentials"]["secret"],
    })

    user.save!
    self.current_user = user
    redirect_to root_path
  end

  def destroy
    self.sign_out!
    redirect_to root_path
  end

  def failure
    redirect_to root_path
  end
end
