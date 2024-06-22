class AddImageToTutorial < ActiveRecord::Migration[7.0]
  def change
    add_column :tutorials, :image, :string
  end
end
