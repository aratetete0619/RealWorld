class AuthenticationController < ApplicationController
  def create
    user = User.find_by(email: params[:user][:email])
    Rails.logger.debug "Found user: #{user.inspect}"

    if user&.authenticate(params[:user][:password])
      Rails.logger.debug "Authentication successful"
      render json: { token: user.generate_jwt }, status: :ok
    else
      Rails.logger.debug "Authentication failed"
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end
end
