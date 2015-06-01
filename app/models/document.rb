class Document < ActiveRecord::Base
	validates :nombre, presence: true, length: {minimum: 5, maximum: 30}, uniqueness: true
	validates :fechaRecibido, presence: true
	validates :remitente, presence: true
	validates :estado, presence: true
	validates :categoria, presence: true
	# validates :fechaEntrega, presence: true, on: :update
	# validates :fechaRecibido, presence: true, on: :update
	# validates :responsable, presence: true, on: :update

	def self.search(search)
  		where("id LIKE ?", "%#{search}%") 
  		#where("fechaRecibido LIKE ?", "%#{search}%")
	end
end