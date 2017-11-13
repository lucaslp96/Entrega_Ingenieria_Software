class AnswerCommentReport < ApplicationRecord
    beglons_to :user
	belongs_to :answer_comment
end
