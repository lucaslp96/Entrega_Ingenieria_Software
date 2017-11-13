class Answer < ApplicationRecord
	belongs_to :question
	belongs_to :user
	has_many :answer_votes
	has_many :answer_comments
	has_many :answer_reports
end
