module TestHelpers
  module Features
    def new_bob
      User.create(email: 'bob@bob.bob', password: 'Bob1234!', name: 'Bob')
    end

    def new_barb
      User.create(email: 'barb@barb.barb', password: 'Barb321!', name: 'Barb')
    end

    # Login helpers return the user if login was successful, false if not
    def login_bob
      user = new_bob
      login_user(user, 'Bob1234!')
    end

    def login_user(user, password)
      visit root_path

      fill_in :email, with: user.email
      fill_in :password, with: password
      click_on 'Log In'

      if current_path == user_path(user)
        return user
      end
      false
    end
  end
end
