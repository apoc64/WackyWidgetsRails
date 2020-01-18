class User < ApplicationRecord
  authenticates_with_sorcery!
  validates_presence_of :email
  validates_uniqueness_of :email
  validate :password_complexity

  has_many :widgets

  enum role: %i[default admin]

  private

  def password_complexity
    return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}$/
    errors.add :password, 'Password must be 8-70 characters, and contain at least one lowercase, uppercase, number, and special character'
  end
end
