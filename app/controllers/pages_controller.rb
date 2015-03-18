class PagesController < ApplicationController
  helper_method :current_user, :signed_in?

  def index 
    @current_user = current_user
  end
end
