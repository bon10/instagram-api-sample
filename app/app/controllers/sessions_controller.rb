class SessionsController < ApplicationController
  def create
    # providerに設定される値は facebook のみを前提とする
    token = auth_hash["credentials"]["token"]
    if token.present?
      # Instagram Bussiness Account の情報を取得
      ig_account_info = get_instagram_info(token)
      Rails.logger.info ig_account_info

      # アカウント情報があれば登録
      if ig_account_info.present?
        user = User.find(current_user.id)
        user.update_or_create_insta_info(ig_account_info, auth_hash)
      end
      return redirect_to settings_path(current_user.id), notice: '連携しました'
    else
      return redirect_back(fallback_location: settings_path(current_user.id)), notice: "連携失敗しました。"
    end
  end

  protected

  def auth_hash
    request.env["omniauth.auth"]
  end

  private
  def get_instagram_info(token)
    # TODO: ここでInstagram Graph API の取得を行っているが、別のメソッドやクラスにまとめたほうがベター
    client = InstagramGraphApi.client(token)
    res = client.ig_business_accounts("username,followers_count,follows_count")
    Rails.logger.info res.inspect
    return res.first
  end
end