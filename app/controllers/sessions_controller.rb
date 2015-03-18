class SessionsController < ApplicationController
  
  helper_method :current_user, :signed_in?

  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      user.update_attribute(:last_signed_in_at, Time.now)
      redirect_to root_path, notice: 'Login success!'
    else
      redirect_to new_session_path, notice: 'Wrong password!'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: 'You sucessfuly logged out'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end