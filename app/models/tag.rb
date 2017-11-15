class Tag < ApplicationRecord
    has_many :question_tags
    validates :content, uniqueness: true
end
