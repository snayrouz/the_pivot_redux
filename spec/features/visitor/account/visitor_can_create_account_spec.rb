require 'rails_helper'

feature "New user can create an account" do
  scenario "should see a link for create account on root page" do
    Role.create([{role: 0}, {role: 1}])
    visit '/'

    expect(page).to have_link("Login")

    click_on "Login"

    expect(current_path).to eq(login_path)
    expect(page).to have_link("Create an account")

    click_on "Create an account"

    fill_in "user[first_name]", with: "Tester"
    fill_in "user[last_name]", with: "McTest"
    fill_in "user[email]", with: "test@testmail.com"
    fill_in "user[password]", with: "testing"
    fill_in "user[address]", with: "dummy address"
    fill_in "user[phone]", with: "+13032229999"

    allow(MessageSender).to receive(:send_code).and_return(true)
    click_on "Submit"

    expect(current_path).to eq(root_path)

    expect(page).to_not have_link "Login"
    expect(page).to have_link "Logout"
  end
end
