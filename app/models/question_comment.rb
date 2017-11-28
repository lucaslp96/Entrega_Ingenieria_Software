class QuestionComment < ApplicationRecord

	belongs_to :user
	belongs_to :question

	validates_length_of :content, :minimum => 8, :allow_blank => false

end
