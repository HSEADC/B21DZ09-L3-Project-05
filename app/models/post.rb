class Post < ApplicationRecord
    validates :title, presence: true
    validates :type, presence: true
    # validates :category, presence: true
    validates :post_image, presence: true

    has_many :comments, dependent: :destroy
    belongs_to :category
    belongs_to :user
    mount_uploader :post_image, PostImageUploader

    acts_as_taggable_on :tags

    # def api_as_json
    #     {
    #         title: title,
    #         description: description,
    #         category_name: category.name,
    #         post_image: post_image
    #     }
    # end
end
