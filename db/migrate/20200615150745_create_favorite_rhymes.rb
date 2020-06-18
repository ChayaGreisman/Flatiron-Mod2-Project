class CreateFavoriteRhymes < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_rhymes do |t|
      t.references :rhyme, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
