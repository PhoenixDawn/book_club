class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :last_name, presence: true

  def full_name
    return"#{first_name} #{last_name}"
  end
end
