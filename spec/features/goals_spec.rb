require 'spec_helper'

describe "the goal setting process" do
  before(:each) do
    visit new_user_url
    page.fill_in("username", with: "Batman")
    page.fill_in("password", with: "iclearlyloverobin")
    click_button('Sign Up')
  end

  it "has a new goal page" do
    visit new_goal_url
    page.should have_content("Set a Goal")
  end

  it "has goal-ey fields" do
    visit new_goal_url
    page.fill_in("title", with: "Base Jump without Parachute")
    page.fill_in("description", with: "Daunting")
    page.choose("incomplete")
    page.choose("public")
    #page.select("Incomplete", from: "Status")
    #page.select("Public", from: "is_private")
    click_button("Achieve!")
  end

  it "shows you lots of goals" do
    visit new_goal_url
    page.fill_in("title", with: "Base Jump without Parachute")
    page.fill_in("description", with: "Daunting")
    page.choose("incomplete")
    page.choose("public")
    click_button("Achieve!")
    visit goals_url
    page.should have_content("Base Jump without Parachute")
  end

  it "doesn't show you private goals" do
    visit new_goal_url
    page.fill_in("title", with: "Rob bank")
    page.fill_in("description", with: "Daunting")
    page.choose("incomplete")
    page.choose("private")
    click_button("Achieve!")
    visit goals_url
    page.should_not have_content("Rob bank")
  end

  it "has a show page with description" do
    visit new_goal_url
    page.fill_in("title", with: "Base Jump without Parachute")
    page.fill_in("description", with: "Daunting")
    page.choose("incomplete")
    page.choose("public")
    click_button("Achieve!")
    visit goals_url
    click_link('Base Jump without Parachute')
    page.should have_content("Daunting")
  end

  it "can see other users' public goals" do
    visit new_goal_url
    page.fill_in("title", with: "Base Jump without Parachute")
    page.fill_in("description", with: "Daunting")
    page.choose("incomplete")
    page.choose("public")
    click_button("Achieve!")
    visit goals_url
    click_button('Log Out')

    visit new_user_url
    page.fill_in("username", with: "Robin")
    page.fill_in("password", with: "imalittlebitch")
    click_button('Sign Up')
    visit goals_url
    page.should have_content('Base Jump without Parachute')
  end

  it "has a tracker page..." do
    visit new_goal_url
    page.fill_in("title", with: "Base Jump without Parachute")
    page.fill_in("description", with: "Daunting")
    page.choose("incomplete")
    page.choose("public")
    click_button("Achieve!")
    visit tracker_url
    page.should have_content('Base Jump without Parachute : Incomplete')
  end


end