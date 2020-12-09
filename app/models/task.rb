class Task < ApplicationRecord
    validates :title, :description, presence: true

    belongs_to :category, optional: true
    belongs_to :user

    # def category_name=(tags)
    #     category = Category.find_or_create_by(tags: tags)
    #     self.category = category
    # end

    # def category_name
    #     self.category ? self.category : nil
    # end
end
