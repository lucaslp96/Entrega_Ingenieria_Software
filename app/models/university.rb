class University < ApplicationRecord

	  # para el buscador
    def self.search(search)
      where("name ILIKE ?", "%#{search}%")
    end

end
