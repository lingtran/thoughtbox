require 'rails_helper'

RSpec.describe "Api::V1::LinksControllers", type: :request do
  describe "UPDATE link" do
    before(:each) do
      user = create(:user)
      @links = create_list(:link, 2, user_id: user.id)
      @previous_read_status = @links.first.read
      @new_read_status = "true"

      patch "/api/v1/users/#{user.id}/links/#{@links.first.id}?read=#{@new_read_status}"
    end

    it "provides a response for updated link read status" do
      expect(response).to have_http_status(200)
      expect(response).to be_success
    end

    it "updates the read status of the idea" do
      expect(response_body[:id]).to eq(@links.first.id)
      expect(response_body[:title]).to eq(@links.first.title)
      expect(response_body[:read]).to eq(@new_read_status)
      expect(response_body[:read]).to eq(Link.first.read)
      expect(@previous_read_status).not_to eq(Link.first.read)
    end
  end

  describe "INDEX link" do
    before(:each) do
      @user = create(:user)
      @links = create_list(:link, 2, user_id: @user.id)
      @link = @links.first.read

      get "/api/v1/users/#{@user.id}/links/"
    end

    it "provides a response for link index for user" do
      expect(response).to have_http_status(200)
      expect(response).to be_success
    end

    it "returns a list of links specific to user" do
      expect(response_body.first[:user_id]).to eq(@user.id)
      expect(response_body.count).to eq(2)
    end
  end
end
