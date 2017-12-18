class University < ApplicationRecord
  validates :name, presence: true, uniqueness: true#, :message => "La etiqueta ya existe."
  validates_length_of :name, :minimum => 3, :maximum => 16, :allow_blank => false#, :message => "La etiqueta debe contener entre 4 y 16 caracteres."
    # para el buscador
    def self.search(search)
      where("name ILIKE ?", "%#{search}%")
    end

end
