require 'rails_helper'

describe 'user registration' do
  it 'creates a user upon signup' do
    visit root_path

    expect(page).to have_link('Sign Up')

    click_on 'Sign Up'

    expect(current_path).to eq(new_user_path)
  end
end
