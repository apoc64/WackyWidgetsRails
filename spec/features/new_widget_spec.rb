require 'rails_helper'

describe 'new widget' do
  it 'wont show for guests' do
    visit(new_widget_path)

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Access Denied')
  end

  it 'can create a widget for logged in user' do
    bob = login_bob

    visit(new_widget_path)

    expect(Widget.count).to eq(0)
    fill_in 'widget[name]', with: 'wow'
    fill_in 'widget[description]', with: 'yowza'
    fill_in 'widget[picture]', with: 'http://www.cat.com/pic'
    # TODO - test color dropdown
    click_on 'Create Widget'

    expect(Widget.count).to eq(1)
    widget = Widget.first
    expect(current_path).to eq(widget_path(widget))
    expect(widget.name).to eq('wow')
    expect(widget.user).to eq(bob)
  end
end
