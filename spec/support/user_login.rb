module UserLogin
  def login_user(user)
    visit login_path
    within(".login-form") do
      fill_in "Email", with: "#{user.email}"
      fill_in "Password", with: "#{user.password}"
      click_button "Log In"
    end
  end
end
