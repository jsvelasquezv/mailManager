class DocumentsController < ApplicationController

	def index
		@documents = Document.all
		if params[:search]
			@documents = Document.search(params[:search]).order("created_at DESC")
		else
			@documents = Document.all.order('created_at DESC')
		end
	end

	def show
		@document = Document.find(params[:id])
	end

	def new
		@document = Document.new
	end

	def create
		@document = Document.new(document_params)
		if @document.save
			redirect_to @document, notice: "Creado correctamente"
		else
			render :new
		end
	end

	def edit
		@document = Document.find(params[:id])	
	end

	def update
		@document = Document.find(params[:id])
		if @document.update_attributes(document_params)
			redirect_to @document, notice: "Actualizado Correctamente"
		else
			render :edit
		end
	end

	private

	def document_params
		params.require(:document).permit(:number, :nombre, :fechaRecibido,
			:remitente, :estado, :categoria, :observaciones, :fechaEntrega,
			:recibidoPor, :fechaArchivo)
	end

end