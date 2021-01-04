require 'rails_helper'

describe 'nav bar' do
  it 'allows logged in user navigation' do
    user = login_bob

    visit root_path

    expect(page).to have_link("My Profile")
    expect(page).to have_link("Widgets", href: widgets_path)
    expect(page).to have_link("Log Out")
    expect(page).to_not have_button("Log In")

    within('nav') do
      click_on "My Profile"
    end
    expect(current_path).to eq(user_path(user))
    expect(page).to have_link("My Profile")
    expect(page).to have_link("Widgets", href: widgets_path)
    expect(page).to have_link("Log Out")
    expect(page).to_not have_button("Log In")

    within('nav') do
      click_on "Widgets"
    end
    expect(current_path).to eq(widgets_path)
    expect(page).to have_link("My Profile")
    expect(page).to have_link("Widgets", href: widgets_path)
    expect(page).to have_link("Log Out")
    expect(page).to_not have_button("Log In")

    within('nav') do
      click_on "Log Out"
    end
    expect(current_path).to eq(root_path)
    expect(page).to_not have_link("My Profile")
    expect(page).to_not have_link("Widgets", href: widgets_path)
    expect(page).to_not have_link("Log Out")

    expect(page).to have_button("Log In")
  end
end
