class LinksController < ApplicationController
  def index
    @user_links = Link.where(user_id: current_user.id)
  end

  def edit
    @link = Link.find_by(user_id: params[:user_id], id: params[:id])
  end

  def create
    link = Link.create(user_id: current_user.id, title: params[:link][:title], url: params[:link][:url])

    redirect_to user_links_path(current_user)
  end

  def update
    @link = Link.find_by(user_id: current_user, id: params[:id])
    if @link.update(link_params)
      redirect_to user_links_path(current_user)
    else
      redirect_to edit_user_link_path(current_user, @link)
    end
  end

  private
    def link_params
      params.require(:link).permit(:title, :url)
    end

end
