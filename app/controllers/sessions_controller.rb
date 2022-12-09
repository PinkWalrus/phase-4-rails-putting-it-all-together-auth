class SessionsController < ApplicationController
  # /login
  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: user, status: :created
    else
      render json: { errors: ["Invalid credentials"] }, status: :unauthorized
  end

    # /logout
  def destroy
    session.delete :user_id
    head :no_content
  end
end
