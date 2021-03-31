class OmniauthCallbacksController < ApplicationController
  before_action :require_user_logged_in!

  def twitter
    # This will log the auth information sent back from Twitter after connecting the account
    # Rails.logger.info auth

    twitter_account = Current.user.twitter_accounts.where(username: auth.info.nickname).first_or_initialize
    twitter_account.update(
      name: auth.info.name,
      username: auth.info.nickname,
      image: auth.info.image,
      token: auth.credentials.token,
      secret: auth.credentials.secret
    )

    redirect_to twitter_accounts_path, notice: "Successfully connected with Twitter"
  end

  def auth
    request.env['omniauth.auth']
  end
end
