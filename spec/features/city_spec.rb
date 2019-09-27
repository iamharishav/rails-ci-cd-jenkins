require "rails_helper"

RSpec.describe "Creating a city", type: :feature do

	scenario "For valid input" do
		visit new_city_path
		fill_in "Name", with: "Bangalore"
		click_on "Create City"
		visit cities_path
		expect(page).to have_content("Bangalore")
	end

	scenario "For invalid input" do
		visit new_city_path
		fill_in "Name", with: ""
		click_on "Create City"
		expect(page).to have_content("Name can't be blank")
	end

	scenario "Updating city with valid input" do
		city = City.create!(:name => "Bangalore")
		visit edit_city_path(city)
		fill_in "Name", with: "Hyderabad"
		click_on "Update City"
		visit cities_path
		expect(page).to have_content("Hyderabad")
	end

	scenario "Deleting city" do
		city = City.create!(:name => "Bangalore")
		visit cities_path
		expect(page).to have_content("Bangalore")
		click_on "Destoy"
		expect(page).not_to have_content("Bangalore")
	end

end