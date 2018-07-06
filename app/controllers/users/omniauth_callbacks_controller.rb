class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def omniauth_strategy
    @user = User.find_or_create_by(id: request.env['omniauth.auth']['uid'])
    if @user.persisted?
      sign_in_and_redirect @user
    end
  end

  def failure
    redirect_to root_path
  end
end