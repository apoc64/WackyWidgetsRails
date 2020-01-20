class Widget < ApplicationRecord
  belongs_to :user
  enum color: %i[red blue green yellow purple]

  def self.all_public
    where(is_public: true)
  end

  def self.color_options
    colors.keys
  end
end
