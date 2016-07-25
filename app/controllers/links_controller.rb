class LinksController < ApplicationController
  def index
    @user_links = Link.find_by(user_id: current_user.id)
  end

  def create
    link = Link.create(user_id: current_user.id, title: params[:link][:title], url: params[:link][:url])

  redirect_to user_links_path(current_user)
  end
end
