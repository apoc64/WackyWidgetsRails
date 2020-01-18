require 'rails_helper'

describe 'widget index' do
  it 'wont show for guests' do
    visit(widgets_path)

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Access Denied')
  end

  it 'shows widgets to logged in user' do
    bob = login_bob
    widget1 = Widget.create(name: 'wow', description: 'yowza', color: 'red', picture: 'http://www.cat.com/pic', is_public: true, user: bob)

    visit(widgets_path)

    expect(current_path).to eq(widgets_path)
    expect(page).to_not have_content('Access Denied')

    expect(page).to have_content('wow')
    expect(page).to have_content('yowza')
    expect(page).to have_content('red')
    expect(page).to have_content('true')
    expect(page).to have_content('Bob')
  end
end
