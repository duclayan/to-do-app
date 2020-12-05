class Category < ApplicationRecord
    validates :name, presence: true

    has_many :task, dependent: :destroy
end
