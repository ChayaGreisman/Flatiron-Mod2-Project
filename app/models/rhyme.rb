class Rhyme < ApplicationRecord
  belongs_to :rhyme_category
  has_many :favorite_rhymes
  has_many :users, through: :favorite_rhymes
end
