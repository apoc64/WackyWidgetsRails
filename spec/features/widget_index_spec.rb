require 'rails_helper'

describe 'widget index' do
  it 'wont show for guests' do
    visit(widgets_path)

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Access Denied")
  end
end
