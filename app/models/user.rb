class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :questions
	has_many :answers
	has_many :answer_comments
	has_many :answer_reports
	has_many :question_reports
	has_many :question_comments
	has_many :question_votes
	has_many :answer_votes
end
