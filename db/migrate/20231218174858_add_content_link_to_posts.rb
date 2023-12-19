class AddContentLinkToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :content_link, :string
  end
end
