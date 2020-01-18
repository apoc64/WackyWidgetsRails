module TestHelpers
  module Features
    def new_bob
      User.create(email: 'bob@bob.bob', password: 'Bob1234!', name: 'Bob')
    end

    def new_barb
      User.create(email: 'barb@barb.barb', password: 'Barb321!', name: 'Barb')
    end

    def login_bob
      user = new_bob

      visit root_path
      expect(page).to_not have_content('Log Out')
      expect(page).to have_button('Log In')

      within('nav') do
        fill_in :email, with: user.email
        fill_in :password, with: 'Bob1234!'
        click_on 'Log In'
      end

      user
    end

    def login_user(user, password)
      visit root_path

      within('nav') do
        fill_in :email, with: user.email
        fill_in :password, with: password
        click_on 'Log In'
      end

      current_path == user_path(user)
    end
  end
end
