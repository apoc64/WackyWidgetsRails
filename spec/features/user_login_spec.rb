require 'rails_helper'

describe 'user login' do
  it 'filling out login form on root path takes user to show path' do
    user = new_bob
    expect(user.role).to eq('default')

    visit root_path

    expect(page).to_not have_content('Log Out')
    expect(page).to have_button('Log In')

    within('nav') do
      fill_in :email, with: user.email
      fill_in :password, with: 'Bob1234!'
      click_on 'Log In'
    end

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content('Hi Bob')
    expect(page).to have_content('Logged in successfully')
    expect(page).to have_content('Log Out')
    expect(page).to_not have_content('Invalid email or password')
    expect(page).to_not have_button('Log In')
  end

  it 'prevents users from logging in with wrong password' do
    user = new_bob
    visit root_path

    expect(page).to_not have_content('Log Out')
    expect(page).to have_button('Log In')

    within('nav') do
      fill_in :email, with: user.email
      fill_in :password, with: '125'
      click_on 'Log In'
    end

    expect(current_path).to_not eq(user_path(user))
    expect(page).to_not have_content('Bob')
    expect(page).to_not have_content('Logged in successfully')
    expect(page).to_not have_content('Log Out')
    expect(page).to have_content('Invalid email or password')
    expect(page).to have_button('Log In')
  end

  it 'prevents guests from seeing user show' do
    user = new_bob

    visit user_path(user)

    expect(current_path).to eq(root_path)
    expect(page).to have_button('Log In')
    expect(page).to_not have_content('Log Out')
    expect(page).to have_content('Access Denied')
  end

  it 'allows user to logout' do
    user = login_bob

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content('Hi Bob')

    within('nav') do
      click_on 'Log Out'
    end

    expect(current_path).to eq(root_path)
    expect(page).to have_button('Log In')
    expect(page).to_not have_content('Log Out')
    expect(page).to have_content('Logged out successfully')

    visit user_path(user)

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Access Denied')
  end

  it 'prevents logged in user from seeing another user show' do
    user = new_barb
    login_bob

    visit user_path(user)

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Access Denied')
  end
end
