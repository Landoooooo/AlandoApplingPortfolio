class Post < ApplicationRecord
    belongs_to :user
    extend FriendlyId
    friendly_id :title, use: :slugged
    has_many_attached :images, dependent: false
    validates :title, presence: true

    def thumbnail input
        return self.images[input].variant(resize: '600x600').processed
    end
end
