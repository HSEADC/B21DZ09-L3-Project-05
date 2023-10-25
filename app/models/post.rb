class Post < ApplicationRecord
    has_many :comments
    belongs_to :category
    belongs_to :user
    mount_uploader :post_image, PostImageUploader
end
