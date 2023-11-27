class Post < ApplicationRecord
    has_many :comments
    belongs_to :category
    belongs_to :user
    mount_uploader :post_image, PostImageUploader

    # def api_as_json
    #     {
    #         title: title,
    #         description: description,
    #         category_name: category.name,
    #         post_image: post_image
    #     }
    # end
end
