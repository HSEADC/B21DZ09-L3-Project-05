class CreateIdeasTutorialsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :ideas, :tutorials
  end
end
