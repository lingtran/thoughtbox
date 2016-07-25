require 'rails_helper'

RSpec.feature "UserCanEditLinks", type: :feature do
  scenario "authenticated user can edit a link" do
    user = create(:user)
    link = create(:link, user_id: user.id)

    edit_of_link = { title: "I love Pikachu",
                     url: "https://turing.io" }

    login_user(user)

    within(".link-box") do
      click_link "Edit"
    end

    expect(page).to have_current_path edit_user_link_path(user, link)

    within('.edit-form') do
      fill_in "Title", with: "#{edit_of_link[:title]}"
      click_button "Save Changes"
    end

    expect(page).to have_current_path user_links_path(user)

    within('.link-lists') do
      expect(page).to have_content "#{edit_of_link[:title]}"
      expect(page).not_to have_content "#{link.title}"
    end
  end
end
