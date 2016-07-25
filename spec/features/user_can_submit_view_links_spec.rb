require 'rails_helper'

RSpec.feature "User Can Submit and View Links", type: :feature do
  scenario "authenticated user can submit a link and see index of links" do
    user = create(:user)
    login_user(user)

    new_link = { title: "I Can Share With Friends - Hello Kitty",
                 url: "https://www.youtube.com/watch?v=UXW5_Dgj_5o" }

    invalid_link = { title: "I love Pikachu",
                     url: "turing.io" }

    error_message = "Please enter a URL."

    within(".new-link-form") do
      fill_in "Title", with: new_link[:title]
      fill_in "URL", with: new_link[:url]
      click_button "Submit"
    end

    within(".link-lists") do
      expect(page).to have_content new_link[:title]
      expect(page).to have_content new_link[:url]
    end

    within(".new-link-form") do
      fill_in "Title", with: invalid_link[:title]
      fill_in "URL", with: invalid_link[:url]
      click_button "Submit"
    end

    within(".link-lists") do
      expect(page).not_to have_content invalid_link[:title]
      expect(page).not_to have_content invalid_link[:url]
    end
  end
end
