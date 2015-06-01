class AddResponsable < ActiveRecord::Migration
  def change
  	add_column :documents, :responsable, :string
  end
end
