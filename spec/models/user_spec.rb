require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of (:email) }

    it 'only saves users with strong passwords' do
      user = User.create(email: 'bob@bob.bob', password: '1234')
      expect(user.persisted?).to eq(false)

      user = User.create(email: 'bob@bob.bob', password: '1234abcd')
      expect(user.persisted?).to eq(false)

      user = User.create(email: 'bob@bob.bob', password: '1234Abcd')
      expect(user.persisted?).to eq(false)

      user = User.create(email: 'bob@bob.bob', password: '1234Abcdef')
      expect(user.persisted?).to eq(false)

      user = User.create(email: 'bob@bob.bob', password: '123456789!')
      expect(user.persisted?).to eq(false)

      user = User.create(email: 'bob@bob.bob', password: 'qwertyuio!')
      expect(user.persisted?).to eq(false)

      expect(User.all.count).to eq(0)

      user = User.create(email: 'bob@bob.bob', password: '1234Abc!')
      expect(user.persisted?).to eq(true)
      expect(User.all.count).to eq(1)
    end
  end
end
