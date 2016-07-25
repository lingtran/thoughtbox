require 'rails_helper'

RSpec.feature "User Can Log In or Sign Up", type: :feature do
  scenario "unauthenticated user can sign up" do
    visit root_path

    expect(page).to have_current_path login_path

    within(".login-form") do
      expect(page).to have_button "Log In"
      expect(page).to have_link "Sign Up"
      click_link "Sign Up"
    end

    expect(page).to have_current_path signup_path

    within(".signup-form") do
      fill_in "Email", with: "user@fake.com"
      fill_in "Password", with: "password"
      fill_in "Confirm Password", with: "password"
      click_button "Sign Up"
    end

    expect(page).to have_current_path user_links_path(User.all.first)

    expect(page).to have_content "Links Index"
  end

  scenario "authenticated user can log in and sign out" do
    user = create(:user)

    login_user(user)

    expect(page).to have_link "Sign Out"
    expect(page).to have_content "Links Index"

    click_link "Sign Out"

    expect(page).to have_current_path login_path
  end

end
