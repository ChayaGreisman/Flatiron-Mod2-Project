class CreateRhymes < ActiveRecord::Migration[6.0]
  def change
    create_table :rhymes do |t|
      t.string :title
      t.string :video_url
      t.string :author
      t.references :rhyme_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
