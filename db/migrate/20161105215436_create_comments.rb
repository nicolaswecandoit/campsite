class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :camping, foreign_key: true
      t.text :body
      t.boolean :publish

      t.timestamps
    end
  end
end
