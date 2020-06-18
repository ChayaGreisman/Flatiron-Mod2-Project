class FavoriteRhyme < ApplicationRecord
  belongs_to :rhyme
  belongs_to :user
end
