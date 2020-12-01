class Task < ApplicationRecord
    validates :title, :description, presence: true

    belongs_to :category
end
