class News < ApplicationRecord
    belongs_to :user
    has_many :category
end
