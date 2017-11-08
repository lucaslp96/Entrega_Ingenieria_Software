class AnswerCommentReport < ApplicationRecord
	beglons_to:user
	belongs_to:answerComment
end
