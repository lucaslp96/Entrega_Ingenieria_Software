class Answer < ApplicationRecord

	scope :porfecha, -> { order("created_at desc") }
	scope :porvotos, -> { order("votes desc") }

	belongs_to :question
	has_many :answer_votes
	has_many :answer_comments
	has_many :answer_reports

	validates_length_of :content, :minimum => 16, :allow_blank => false

end
