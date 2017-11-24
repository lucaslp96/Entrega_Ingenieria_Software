class Question < ApplicationRecord

	scope :porfecha, -> { order("created_at desc") }
		scope :porvotos, -> { order("votes desc") }
		scope :masvisitada, -> { order("visits desc").first }

		belongs_to :user
		has_many :answers
		has_many :question_reports
		has_many :question_comments
		has_many :question_votes
		has_many :question_tags
		has_many :tags, through: :question_tags

	  validates :title, :content, presence: true
	  validate :tags_between_1_and_5


	def self.masvisitada
		Question.all.order("visits desc").first
	end

	def self.masvotada
		Question.all.order("votes desc").first
	end

	private

  def tags_between_1_and_5
    errors.add(:tag_ids,"Cantidad errónea de etiquetas") if tag_ids.size > 5 || tag_ids.size < 1
  end
end
