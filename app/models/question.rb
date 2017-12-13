class Question < ApplicationRecord

		scope :porfecha, -> { order("created_at desc") }
		scope :porvotos, -> { order("votes desc") }
		scope :porvisitas, -> { order("visits desc") }
		scope :porrespuestasmayor, -> { order("numanswers desc") }
		scope :porrespuestasmenor, -> { order("numanswers asc") }

		belongs_to :user
		has_many :answers
		has_many :question_reports
		has_many :question_comments
		has_many :question_votes
		has_many :question_tags
		has_many :tags, through: :question_tags
		validate :tags_between_1_and_5
	  	validates :title, :content, presence: true


	def self.masvisitada
		Question.all.order("visits desc").first
	end

	def self.masvotada
		Question.all.order("votes desc").first
	end

	def self.masrespuestas
		Question.all.order("numanswers desc").first
	end

	def self.trending
		Question.order("created_at desc").limit(10)&
		Question.order("votes desc").limit(5)&
		Question.order("numanswers desc").limit(5)
	end


	private
  # para el buscador
    def self.search(search)
      where("title ILIKE ?", "%#{search}%")
    end


  def tags_between_1_and_5
    errors.add(:tag_ids,"Cantidad errónea de etiquetas") if tag_ids.size > 5 || tag_ids.size < 1
  end

end
