class Question < ApplicationRecord
	
	scope :porfecha, -> { order("created_at desc") }
	scope :porvotos, -> { order("votes desc") }
	scope :porvisitas, -> { order("visits desc") }	

	belongs_to :user
	has_many :answers
	has_many :question_reports
	has_many :question_comments
	has_many :question_votes
	has_many :question_tags

	def self.masvisitada
		Question.all.order("visits desc").first
	end

	def self.masvotada
		Question.all.order("votes desc").first
	end
end

