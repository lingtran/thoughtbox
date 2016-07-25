require 'rails_helper'

RSpec.feature "User Can Submit and View Links", type: :feature do
  # As an authenticated user viewing the main page (links#index), I should see a simple form to submit a link.
  #
  # The Link model should include:
  #
  # A valid URL location for the link
  # A title for the link
  # Additionally, all links have a read status that is either true or false. This column will default to false.
  #
  # Submitting an invalid link should result in an error message being displayed.
  #
  # Hint: Use Ruby's built in URI.parse method to determine if a link is a valid URL or not. This StackOverflow post has more information. Alternatively, you could use a gem like this one.
  #
  # Once a link has been submitted, loading the index page should display all of my links.

  scenario "authenticated user can submit a link and see index of links" do
    login_user

    new_link = { title: "I Can Share With Friends - Hello Kitty",
                 url: "https://www.youtube.com/watch?v=UXW5_Dgj_5o" }

    invalid_link = { title: "I love Pikachu",
                     url: "youtube" }

    error_message = "Please submit a link in the correct format."

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

    expect(page).to have_content error_message

  end
end
