class Question < ApplicationRecord

    scope :porfecha,   -> { order("created_at desc") }
    scope :porvotos,   -> { order("votes desc") }
    scope :porvisitas, -> { order("visits desc") }

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

# para el buscador
    def self.search(search)
      where("title ILIKE ?", "%#{search}%")
    end

private

    def tags_between_1_and_5

        errors.add(:tag_ids,"Cantidad errónea de etiquetas") if tag_ids.size > 5 || tag_ids.size < 1

    end

end
