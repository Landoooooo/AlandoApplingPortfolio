class Project < ApplicationRecord
    belongs_to :user, optional: true
    extend FriendlyId
    friendly_id :title, use: :slugged
    has_many_attached :images
end