class SessionsController < ApplicationController
  skip_before_action :authenticate, only: :create

  def create
    if user = Session.authenticate(params[:username], params[:password])
      token = AuthToken.issue(user_id: user.id)
      $redis.hset(token, 'user_id', user.id)
      $redis.expire(token, 20.minutes.to_i)
      render json: { token: token}
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end

  private

  def authentication_params
    # Todo - Use authentication_params
    params.require(:authentication).permit(:username, :password)
  end
end
