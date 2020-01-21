module LoginHelper
  def user_signup
    fill_in("user[email]", :with => "user@gmail.com")
    fill_in("user[password]", :with => "12345")
    fill_in("user[password_confirmation]", :with => "12345")
    click_button('Create my account')
  end

  def user_login
    fill_in("session[email]", :with => "user@gmail.com")
    fill_in("session[password]", :with => "12345")
    click_button('Login')
  end
end
