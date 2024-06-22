class AddSlugToIdeas < ActiveRecord::Migration[7.0]
  def change
    add_column :ideas, :slug, :string
    add_index :ideas, :slug, unique: true
  end
end
