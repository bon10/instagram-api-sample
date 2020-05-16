class SessionsController < ApplicationController
  def create
    # request.env['omniauth.auth']はTwitter認証で得た情報を格納するもの
    user = User.find_or_create_from_auth_hash(request.env['omniauth.auth']
    if user
      session[:user_id] = user.id
      session[:user_name] = user.username
      redirect_to root_path, notice: "連携しました。"
    else
      redirect_back(fallback_location: setting_path), notice: "連携失敗しました。"
    end
  end
end