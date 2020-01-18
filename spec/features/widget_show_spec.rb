require 'rails_helper'

describe 'widget show' do
  it 'wont show for guests' do
    bob = new_bob
    widget = Widget.create(name: 'wow', description: 'yowza', color: 'red', picture: 'http://www.cat.com/pic', is_public: true, user: bob)

    visit(widget_path(widget))

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Access Denied')
  end

  it 'will show for logged in users' do
    bob = login_bob
    widget = Widget.create(name: 'wow', description: 'yowza', color: 'red', picture: 'http://www.cat.com/pic', is_public: true, user: bob)

    visit(widget_path(widget))

    expect(current_path).to eq(widget_path(widget))
    expect(page).to_not have_content('Access Denied')
  end

  it 'wont show other users widgets' do
    barb = new_barb
    bob = login_bob
    widget = Widget.create(name: 'wow', description: 'yowza', color: 'red', picture: 'http://www.cat.com/pic', is_public: true, user: barb)

    visit(widget_path(widget))

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Access Denied')
  end
end
