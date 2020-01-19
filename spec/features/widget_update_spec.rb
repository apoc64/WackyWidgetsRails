require 'rails_helper'

describe 'widget update' do
  it 'wont show for guests' do
    bob = new_bob
    widget = Widget.create(name: 'wow', description: 'yowza', color: 'red', picture: 'http://www.cat.com/pic', is_public: true, user: bob)

    visit(edit_widget_path(widget))

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Access Denied')
  end

  it 'allows user to edit their widgets' do
    bob = login_bob
    widget = Widget.create(name: 'wow', description: 'yowza', color: 'red', picture: 'http://www.cat.com/pic', is_public: true, user: bob)

    visit(edit_widget_path(widget))

    expect(Widget.count).to eq(1)
    expect(current_path).to eq(edit_widget_path(widget))
    expect(page).to_not have_content('Access Denied')

    fill_in 'widget[name]', with: 'meow'
    fill_in 'widget[description]', with: 'meowza'
    fill_in 'widget[picture]', with: 'http://www.dog.com/pic'
    click_on 'Update Widget'

    expect(current_path).to eq(widget_path(widget))
    expect(page).to have_content('meow')
    expect(page).to_not have_content('wow')
    expect(page).to have_content('meowza')
    expect(page).to_not have_content('yowza')
    expect(page).to have_content('dog.com')
    expect(page).to_not have_content('cat.com')
    expect(Widget.count).to eq(1)
  end

  it 'wont allow editing other peoples widgets' do
    barb = new_barb
    widget = Widget.create(name: 'wow', description: 'yowza', color: 'red', picture: 'http://www.cat.com/pic', is_public: true, user: barb)
    login_bob

    visit(edit_widget_path(widget))

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Access Denied')
  end
end
