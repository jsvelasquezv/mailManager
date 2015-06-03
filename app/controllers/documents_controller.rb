class DocumentsController < ApplicationController

	add_breadcrumb "Inicio", :root_path	
	add_breadcrumb "Documentos", :documents_path

	def index
		#@documents = Document.all
		if params[:search]
			@documents = Document.search(params[:search]).order("created_at DESC")
		else
			@documents = Document.all.order('created_at DESC')
		end
	end

	def show
		@document = Document.find(params[:id])
		add_breadcrumb @document.nombre, document_path(@document)
	end

	def new
		@document = Document.new
		add_breadcrumb "Radicar"
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
		add_breadcrumb "Entregar-Archivar"
	end

	def update
		@document = Document.find(params[:id])
		if params[:fechaArchivo] != ""
			@document.estado = "Archivado"
		end			
		if @document.update_attributes(document_params)
			redirect_to @document, notice: "Actualizado Correctamente"
		else
			render :edit
		end
	end

	private

	def document_params
		params.require(:document).permit(:nombre, :fechaRecibido,
			:remitente, :estado, :categoria, :observaciones, :fechaEntrega,
			:recibidoPor, :fechaArchivo, :responsable, :search)
	end

end