require 'rails_helper'

describe Widget, type: :model do
  describe 'relationships' do
    it { should belong_to (:user)}
  end

  describe('helpers') do
    it 'can give its color options' do
      colors = Widget.color_options
      expect(colors).to eq(['red', 'blue', 'green', 'yellow', 'purple'])
    end
  end
end
