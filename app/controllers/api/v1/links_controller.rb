class Api::V1::LinksController < Api::ApiController
  before_filter :link_params, on: [:update]

  def index
    link = Link.where(user_id: params[:user_id]).order("title ASC")
    respond_with link, json: link
  end

  def update
    link = Link.find_by(user_id: params[:user_id], id: params[:link_id])
    link.update(link_params)
    respond_with link, json: link
  end

  private

    def link_params
      params.permit(:title, :url, :read)
    end

end
