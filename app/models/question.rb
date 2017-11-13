class Question < ApplicationRecord
	belongs_to :user
	has_many :answers
	has_many :question_reports
	has_many :question_comments
	has_many :question_votes
	has_many :question_tags
end
