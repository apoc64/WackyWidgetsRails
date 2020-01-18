class Widget < ApplicationRecord
  belongs_to :user

  enum color: %i[red blue green yellow purple]
end
