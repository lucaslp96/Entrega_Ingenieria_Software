class AnswerCommentReport < ApplicationRecord
    belongs_to :user
	belongs_to :answer_comment
end
