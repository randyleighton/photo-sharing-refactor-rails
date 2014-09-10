require 'rails_helper'

describe "user sign in" do
  it "will successfully allow a user to sign up" do
    visit '/signup'
    fill_in 'Email', with: 'user@email.com'
    fill_in 'Password', with: 'testpassword'
    fill_in 'Password confirmation', with: 'testpassword'
    click_button 'Create User'
    page.should have_content 'Welcome user@email.com'
  end

  it "will take an existing user to the log in page" do
    visit '/signup'
    click_link 'Log In'
    page.should have_content 'Login'
  end
end













    # user = User.create(email: 'user@email.com', password_digest: 'testpassword')
#     fill_in 'Email', with: 'user@email.com'
#     fill_in 'Password', with: 'testpassword'
#     fill_in 'Password confirmation', with: 'testpassword'
#     click_button 'Create User'
# end
