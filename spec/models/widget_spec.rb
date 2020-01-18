require 'rails_helper'

describe Widget, type: :model do
  describe 'relationships' do
    it { should belong_to (:user)}
  end
end
