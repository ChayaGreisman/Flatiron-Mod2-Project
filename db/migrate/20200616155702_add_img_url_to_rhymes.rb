class AddImgUrlToRhymes < ActiveRecord::Migration[6.0]
  def change
    add_column :rhymes, :img_url, :string
  end
end



