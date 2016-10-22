class AddFacebookUrlToCampingsCampings < ActiveRecord::Migration[5.0]
  def change
    add_column :campings, :facebook_url, :string
  end
end
