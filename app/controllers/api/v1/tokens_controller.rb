class Api::V1::TokensController < ApplicationController
  def create
    @user = User.find_by_full_name(user_params[:full_name])
    unless @user&.authenticate(user_params[:password])
      head 401
      return
    end

    payload = { user_id: @user.id }
    exp_time = 24.hours.from_now
    if (JsonWebToken rescue nil)
      token = JsonWebToken.encode(payload, exp_time)
      render json: { error_code: 0, data: { token: token, exp_time: exp_time }, message: "ok" }, status: 201
      return
    else
      head 401
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :password)
  end

end