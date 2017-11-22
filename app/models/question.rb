class Question < ApplicationRecord
	
	scope :porfecha, -> { order("created_at desc") }
	scope :porvotos, -> { order("votes desc") }
	scope :porvisitas, -> { order("visits desc") }	
	scope :masvisitada, -> { order("visits desc").first }
	scope :masvotada, -> { order("votes desc").first }

	belongs_to :user
	has_many :answers
	has_many :question_reports
	has_many :question_comments
	has_many :question_votes
	has_many :question_tags
end
