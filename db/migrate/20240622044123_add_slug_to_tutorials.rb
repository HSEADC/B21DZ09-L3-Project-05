class AddSlugToTutorials < ActiveRecord::Migration[7.0]
  def change
    add_column :tutorials, :slug, :string
    add_index :tutorials, :slug, unique: true
  end
end
