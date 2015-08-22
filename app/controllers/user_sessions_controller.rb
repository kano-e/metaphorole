class UserSessionsController < ApplicationController
  def create
    account = Account.authenticate(env['omniauth.auth'])
    if current_user && account.user
      if current_user != account.user
        raise # エラーは後で考える
      end

    elsif current_user
      if current_user.accounts.by(account.provider)
        raise # エラーは後で考える
      end
      current_user.accounts << account

    elsif account.user
      unless UserSession.create(account.user)
        raise # エラーは後で考える
      end

    else
      account.build_user
      account.save!
    end

    redirect_to Frontend.callback
  end

  def destroy
    current_user_session.destroy
  end
end
