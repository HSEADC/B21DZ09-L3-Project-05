class CreateTutorials < ActiveRecord::Migration[7.0]
  def change
    create_table :tutorials do |t|
      t.string :title
      t.text :description
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
