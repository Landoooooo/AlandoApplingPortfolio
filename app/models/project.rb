class Project < ApplicationRecord
    belongs_to :user, optional: true
    extend FriendlyId
    friendly_id :title, use: :slugged
    has_many_attached :images, dependent: false
    validates :title, presence: true
    validates :description, presence: true
    


    def thumbnail input
        return self.images[input].variant(resize: '600x600').processed
    end
end