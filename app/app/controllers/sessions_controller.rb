class SessionsController < ApplicationController
  def create
    # providerに設定される値は facebook のみを前提とする
    Rails.logger.info "sdfasdfasdfa"
    info = request.env["omniauth.auth"]['extra']['raw_info']
    Rails.logger.info info.inspect
    #if info.try(:uid).present?
      # FacebookのuidからInstagramのビジネスアカウントのidを取得
      get_instagram_info(info)
      return redirect_to settings_facebook_path(current_user.id, code: params[:code])
    #else
    #  return redirect_back(fallback_location: settings_path(current_user.id)), notice: "連携失敗しました。"
    #end
  end

  private
  def get_instagram_info(info)
    #client = InstagramGraphApi.client(info.token)
    #accounts = client.ig_business_accounts
    #Rails.logger.info "get accounts"
    #Rails.logger.info accounts.inspect
  end
end