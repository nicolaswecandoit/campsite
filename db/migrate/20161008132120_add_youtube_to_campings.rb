class AddYoutubeToCampings < ActiveRecord::Migration[5.0]
  def change
    add_column :campings, :youtube_url, :string
  end
end
