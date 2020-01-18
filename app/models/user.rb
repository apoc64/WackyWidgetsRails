class User < ApplicationRecord
  authenticates_with_sorcery!
  validates_presence_of :email
  validates_uniqueness_of :email
end
