class Tag < ApplicationRecord
  has_many :question_tags
    validates :content, uniqueness: true#, :message => "La etiqueta ya existe."
    validates_length_of :content, :minimum => 4, :maximum => 16, :allow_blank => false#, :message => "La etiqueta debe contener entre 4 y 16 caracteres."

  end
