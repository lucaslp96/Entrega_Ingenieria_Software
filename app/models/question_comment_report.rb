class QuestionCommentReport < ApplicationRecord
	belongs_to :user
	belongs_to :question_comment
end
