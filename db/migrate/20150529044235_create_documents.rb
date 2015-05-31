class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.integer :number
      t.string :nombre
      t.string :fechaRecibido
      t.string :remitente
      t.string :estado
      t.string :categoria
      t.text :observaciones
      t.string :fechaEntrega
      t.string :recibidoPor
      t.string :fechaArchivo

      t.timestamps null: false
    end
  end
end
