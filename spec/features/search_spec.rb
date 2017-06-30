require "rails_helper"

RSpec.feature "User can search" do
  scenario "User enter right query" do
    visit "/"
    fill_in "story-search", with: "dis"
    find(:css, ".search-btn").click
    expect(page).to have_title "dis - MyStories"
  end
end
