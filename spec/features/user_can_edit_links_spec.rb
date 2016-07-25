require 'rails_helper'

RSpec.feature "UserCanEditLinks", type: :feature do
  scenario "authenticated user can edit a link" do
    login_user

    edit_of_link = { title: "I love Pikachu",
                     url: "https://turing.io" }

    within(".link-lists") do
      click_link "Edit Link"
    end

    expect(page).to have_current_path 
  end
end
