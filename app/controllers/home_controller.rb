class HomeController < ApplicationController
  def index
    if current_user == nil
      redirect_to login_path
    else
      redirect_to user_links_path(current_user)
    end
  end
end
