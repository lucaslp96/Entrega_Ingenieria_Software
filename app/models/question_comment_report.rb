class QuestionCommentReport < ApplicationRecord
	belongs_to:user
	belongs_to:questionComment
end
