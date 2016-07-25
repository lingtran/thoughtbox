require 'rails_helper'

RSpec.feature "User Can Log In or Sign Up", type: :feature do
  scenario "unauthenticated user can sign up" do
  # As an unauthenticated user, when I visit the root of the application, I should be redirected to a page which prompts me to "Log In or Sign Up".
  # f I click "Sign Up", I should be taken to a user form where I can enter an email address, a password, and a password confirmation.

  # I cannot sign up with an email address that has already been used.
  # Password and confirmation must match.
  # Upon submitting this information, I should be logged in via a cookie and redirected to the "Links Index" page.

    visit root_path

    expect(page).to have_current_path login_path

    within(".login-form") do
      expect(page).to have_button "Log In"
      expect(page).to have_button "Sign Up"
      click_button "Sign Up"
    end

    expect(page).to have_current_path signup_path

    within(".signup-form") do
      fill_in "Email", with: "email_address"
      fill_in "Password", with: "password"
      fill_in "Password Confirmation", with: "password"
      click_button "Submit"
    end

    expect(page).to have_current_path root_path

    expect(page).to have_content "Links Index"
  end
end
