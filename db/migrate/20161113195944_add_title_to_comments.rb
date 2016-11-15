class AddTitleToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :title, :string
    add_column :comments, :service, :integer
    add_column :comments, :communication, :integer
    add_column :comments, :qualiteprix, :integer
    add_column :comments, :situation, :integer
    add_column :comments, :proprete, :integer
    add_column :comments, :animation, :integer
  end
end
