class Answer < ApplicationRecord
	belongs_to:question
	belongs_to:user
	has_many:answerVotes
	has_many:answerComments
	has_many:answerReports
end
