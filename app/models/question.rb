class Question < ApplicationRecord
	belongs_to:user
	has_many:answers
	has_many:questionReports
	has_many:questionComments
	has_many:questionVotes
	has_and_belongs_to_many:tags
end
