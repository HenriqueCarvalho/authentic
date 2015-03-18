class UsersController < ApplicationController

  helper_method :current_user, :signed_in?

  def index
    if current_user.admin
      @users = User.all
    else
      redirect_to root_path , notice: 'Acess denied'
    end 
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Thanks for signing up!'
    else
      render 'new'
    end
  end

  def edit
    @current_user = current_user
    @user = User.find(params[:id])
    if @current_user.id != @user.id
      redirect_to root_path, notice: 'Access denied'
    end     
  end 

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to root_path, notice: 'Update successful' 
    else
      render :edit
    end
  end

  def destroy
    if current_user.admin
      @user = User.find(params[:id])
      @user.destroy
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :admin)
  end

end
