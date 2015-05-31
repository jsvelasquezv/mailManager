class Document < ActiveRecord::Base
	validates :number, presence: true, length: {minimum: 5, maximum: 10}
	validates :nombre, presence: true, length: {minimum: 5, maximum: 30}
	validates :fechaRecibido, presence: true
	validates :remitente, presence: true
	validates :estado, presence: true
	validates :categoria, presence: true

	def self.search(search)
  		where("number LIKE ?", "%#{search}%") 
  		where("nombre LIKE ?", "%#{search}%")
	end
end