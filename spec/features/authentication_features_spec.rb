require 'rails_helper'

describe "user sign in" do
  it "will successfully allow a user to sign up" do
    visit '/signup'
    fill_in 'Email', with: 'user@email.com'
    fill_in 'Password', with: 'testpassword'
    fill_in 'Password confirmation', with: 'testpassword'
    click_button 'Create User'
    expect(page).to have_content 'Welcome user@email.com'
  end

  it "will take an existing user to the log in page" do
    visit '/signup'
    click_link 'Log In'
    expect(page).to have_content 'Login'
  end

  it "will login a user who enters credentials successfully" do
    user = User.create(email: 'user@email.com', password: 'testpassword')
    visit '/login'
    fill_in 'Email', with: 'user@email.com'
    fill_in 'Password', with: 'testpassword'
    click_button 'Log In'
    expect(page).to have_content 'Welcome user@email.com'
  end

  it "will successfully log out a user" do
    user1 = User.create(email: 'user@email.com', password: 'testpassword')
    visit '/login'
    fill_in 'Email', with: 'user@email.com'
    fill_in 'Password', with: 'testpassword'
    click_button 'Log In'
    click_link 'Log Out'
    expect(page).to have_content 'logged out'
  end
end
