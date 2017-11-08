class User < ApplicationRecord
	has_many:questions
	has_many:answers
	has_many:answerComments
	has_many:answerReports
	has_many:questionReports
	has_many:questionComments
	has_many:questionVotes
	has_many:answerVotes	
	has_many_and_belongs_to_many:tags
end
