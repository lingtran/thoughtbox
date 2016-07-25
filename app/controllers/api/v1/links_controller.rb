class Api::V1::IdeasController < Api::ApiController
  # before_filter :idea_params, on: [:create, :update]

  def update
    link = Link.find(params[:id].to_i)
    link.update(current_user, link_params)
    respond_with link, json: link
  end

  private

    def link_params
      params.permit(:title, :url, :read)
    end

end
