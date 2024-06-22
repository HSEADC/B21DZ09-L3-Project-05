class Tutorial < ApplicationRecord
    
    extend FriendlyId
    friendly_id :title, use: :slugged

    belongs_to :user
    mount_uploader :image, PostImageUploader

    validates :title, presence: true
    validates :description, presence: true
    validates :image, presence: true
    # validates :content, presence: true
    
    acts_as_taggable_on :tags

    has_many :poly_comments, as: :commentable, dependent: :destroy
end
