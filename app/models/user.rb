class User < ApplicationRecord
  has_many :favorite_books
  has_many :books, through: :favorite_books
  has_many :favorite_rhymes
  has_many :rhymes, through: :favorite_rhymes
  validates :username, uniqueness: true, presence: true
  validates :name, presence: true
  validates :age, presence: true
  before_validation :make_caps

  private

  def make_caps
    self.name.capitalize!
  end
end
