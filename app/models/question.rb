class Question < ApplicationRecord

		scope :porfecha, -> { order("created_at desc") }
		scope :porvotos, -> { order("votes desc") }
		scope :porvisitas, -> { order("visits desc") }
		scope :porrespuestas, -> { order("numanswers desc") }
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
		if(Question.all.count < 10)
			q = Question.order("created_at desc")
		else
			q = Question.order("created_at desc").limit(10)
		end
		if(Question.all.count < 5)
			q.order("votes desc")
		else
			q.order("votes desc").limit(5)
		end
		if(Question.all.count < 3)
			q = Question.all
		else
			q.order("numanswers desc").limit(3)
		end
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
