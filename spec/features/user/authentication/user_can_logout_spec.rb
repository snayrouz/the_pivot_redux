 require 'rails_helper'

RSpec.describe "As a visitor I can login" do
	it "as a user I can log out" do
    Role.create([{role: 0}, {role: 1}])
		user = User.create(first_name: "Tester", last_name: "McTesty", email: "testerson@testmail.com", password: "testing", phone: "+13034443333")
		visit '/'
		click_on 'Login'
		fill_in "session[email]", with: "testerson@testmail.com"
		fill_in "session[password]", with: "testing"

		within(".action") do
			click_on("Login")
		end
		click_on 'Logout'
		expect(page).to have_content("Login")

	end

end
