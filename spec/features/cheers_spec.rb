require 'spec_helper'

describe "cheering" do

  before(:each) do
    visit new_user_url
    page.fill_in("username", with: "Batman")
    page.fill_in("password", with: "iclearlyloverobin")
    click_button('Sign Up')
    visit new_goal_url
    page.fill_in("title", with: "Base Jump without Parachute")
    page.fill_in("description", with: "Daunting")
    page.choose("incomplete")
    page.choose("public")
    click_button("Achieve!")
    click_button('Log Out')

    visit new_user_url
    page.fill_in("username", with: "Robin")
    page.fill_in("password", with: "imalittlebitch")
    click_button('Sign Up')
  end

  it "has cheer buttons on the users index page" do
    visit goals_url
    click_button('Cheer This User On!')
  end

  it "doesn't show button if already cheered" do
    visit goals_url
    click_button('Cheer This User On!')
    visit goals_url
    page.should_not have_button("Cheer This User On!")
  end

end
