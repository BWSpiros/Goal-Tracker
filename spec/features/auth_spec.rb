require 'spec_helper'

describe "the signup process" do

  it "has a new user page" do
    visit new_user_url
    page.should have_content("Sign Up")
  end

  it "has signup fields" do
    visit new_user_url
    page.fill_in("username", with: "Batman")
    page.fill_in("password", with: "iclearlyloverobin")
  end

  describe "signing up a user" do

    it "shows username on the homepage after signup" do
      visit new_user_url
      page.fill_in("username", with: "Batman")
      page.fill_in("password", with: "iclearlyloverobin")
      click_button('Sign Up')
      page.should have_content("Batman")
    end

  end

end

describe "logging in" do
  before(:each) do
    visit new_user_url
    page.fill_in("username", with: "Batman")
    page.fill_in("password", with: "iclearlyloverobin")
    click_button('Sign Up')
  end


  it "shows username on the homepage after login" do
    visit new_session_url
    page.fill_in("username", with: "Batman")
    page.fill_in("password", with: "iclearlyloverobin")
    click_button("Sign In")
    page.should have_content("Batman")
  end
end

describe "logging out" do
  before(:each) do
    visit new_user_url
    page.fill_in("username", with: "Batman")
    page.fill_in("password", with: "iclearlyloverobin")
    click_button('Sign Up')
  end


  it "doesn't show username on the homepage after logout" do
    click_button('Log Out')
    page.should_not have_content("Batman")
  end

end